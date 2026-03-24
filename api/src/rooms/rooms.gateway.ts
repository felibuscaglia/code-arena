import {
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
  ConnectedSocket,
  MessageBody,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';

interface JoinRoomPayload {
  roomId: string;
  displayName: string;
  avatar: string;
}

@WebSocketGateway({ cors: { origin: process.env.FE_URL } })
export class RoomsGateway {
  @WebSocketServer()
  server: Server;

  @SubscribeMessage('join-room')
  handleJoinRoom(
    @ConnectedSocket() client: Socket,
    @MessageBody() payload: JoinRoomPayload,
  ) {
    const { roomId, displayName, avatar } = payload;

    client.join(roomId);

    client.to(roomId).emit('player-joined', {
      id: client.id,
      displayName,
      avatar,
    });

    return { event: 'room-joined', data: { roomId } };
  }
}
