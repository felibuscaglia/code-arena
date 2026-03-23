import { Injectable } from '@nestjs/common';
import { randomUUID } from 'crypto';
import { CreateRoomDto } from './dto/create-room.dto';

@Injectable()
export class RoomsService {
  private readonly rooms = new Map<string, CreateRoomDto>();

  create(dto: CreateRoomDto): string {
    const roomId = randomUUID();
    this.rooms.set(roomId, dto);
    return roomId;
  }
}
