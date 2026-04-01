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
import { SubmissionsService } from '../submissions/submissions.service';
import { RoomStatus } from './enums';
import { HttpStatus } from '@nestjs/common';
import { type JoinRoomPayload } from './interfaces';
import { type CreateSubmissionDto } from '../submissions/dto/create-submission.dto';

@WebSocketGateway({ cors: { origin: process.env.FE_URL } })
export class RoomsGateway implements OnGatewayDisconnect {
  constructor(
    private readonly roomsService: RoomsService,
    private readonly challengesService: ChallengesService,
    private readonly submissionsService: SubmissionsService,
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
    @MessageBody() payload: { roomId: string },
  ) {
    const { roomId } = payload;
    const room = this.roomsService.findById(roomId);
    if (!room) return;

    const challengeId = room.challenges[room.currentRound - 1];
    const challenge = await this.challengesService.getChallengeForRound(challengeId);
    if (!challenge) return;

    room.rounds.push({ startedAt: Date.now(), submittedPlayerIds: [] });
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

  @SubscribeMessage('submit-solution')
  async handleSubmitSolution(
    @ConnectedSocket() client: Socket,
    @MessageBody() payload: CreateSubmissionDto,
  ) {
    const room = this.roomsService.findById(payload.roomId);
    if (!room) return;

    const roundState = room.rounds[room.currentRound - 1];
    roundState.submittedPlayerIds.push(client.id);

    this.server
      .to(payload.roomId)
      .emit('player-submitted', { playerId: client.id });

    const result = await this.submissionsService.submit(payload, 'submit');

    const score = this.submissionsService.calculateScore({
      result,
      code: payload.code,
      roundStartedAt: roundState.startedAt,
      submittedAt: Date.now(),
      roundTime: room.roundTime,
    });

    return { result, score };
  }
}
