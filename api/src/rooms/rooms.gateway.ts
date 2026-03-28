import {
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
  ConnectedSocket,
  MessageBody,
  OnGatewayDisconnect,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';
import { RoomsService } from './rooms.service';
import { ChallengesService } from '../challenges/challenges.service';
import { RoomStatus } from './enums';
import { HttpStatus } from '@nestjs/common';

interface JoinRoomPayload {
  roomId: string;
  displayName: string;
  avatar: string;
  hostToken?: string;
}

@WebSocketGateway({ cors: { origin: process.env.FE_URL } })
export class RoomsGateway implements OnGatewayDisconnect {
  constructor(
    private readonly roomsService: RoomsService,
    private readonly challengesService: ChallengesService,
  ) {}

  @WebSocketServer()
  server: Server;

  handleDisconnect(client: Socket) {
    const roomId = this.roomsService.findRoomByPlayerId(client.id);
    if (!roomId) return;

    this.roomsService.removePlayer(roomId, client.id);
    this.server.to(roomId).emit('player-left', client.id);
  }

  @SubscribeMessage('join-room')
  handleJoinRoom(
    @ConnectedSocket() client: Socket,
    @MessageBody() payload: JoinRoomPayload,
  ) {
    const { roomId, displayName, avatar, hostToken } = payload;

    const player = this.roomsService.addPlayer(
      roomId,
      displayName,
      avatar,
      client.id,
      hostToken,
    );

    client.join(roomId);

    client.to(roomId).emit('player-joined', player);

    const room = this.roomsService.findById(roomId);

    if (room?.maxPlayers && room?.players.size >= room.maxPlayers) {
      this.server.to(roomId).emit('start-game');
    }

    return { event: 'room-joined', data: { roomId, player } };
  }

  @SubscribeMessage('start-game')
  async handleStartGame(
    @ConnectedSocket() client: Socket,
    @MessageBody() payload: { roomId: string },
  ) {
    const { roomId } = payload;
    const room = this.roomsService.findById(roomId);
    if (!room) return;

    const challengeId = room.challenges[room.currentRound - 1];
    const challenge = await this.challengesService.getChallengeForRound(challengeId);
    if (!challenge) return;

    this.roomsService.updateStatus(roomId, RoomStatus.IN_PROGRESS);
    this.server.to(roomId).emit('start_round', {
      round: room.currentRound,
      challenge,
    });
  }

  @SubscribeMessage('send-message')
  handleMessage(
    @ConnectedSocket() client: Socket,
    @MessageBody()
    payload: { roomId: string; playerName: string; message: string },
  ) {
    client.to(payload.roomId).emit('new-message', {
      playerName: payload.playerName,
      message: payload.message,
      timestamp: Date.now(),
    });

    return HttpStatus.ACCEPTED;
  }
}
