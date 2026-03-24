import { Injectable } from '@nestjs/common';
import { randomUUID } from 'crypto';
import { CreateRoomDto } from './dto/create-room.dto';
import { Room } from './interfaces/room.interface';

@Injectable()
export class RoomsService {
  private readonly rooms = new Map<string, Room>();

  create(dto: CreateRoomDto): string {
    const roomId = randomUUID();
    const socketRoom = `room:${roomId}`;
    this.rooms.set(roomId, { ...dto, socketRoom });
    return roomId;
  }
}
