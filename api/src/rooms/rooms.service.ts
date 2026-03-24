import { Injectable } from '@nestjs/common';
import { randomUUID } from 'crypto';
import { CreateRoomDto } from './dto/create-room.dto';
import { Room } from './interfaces/room.interface';

@Injectable()
export class RoomsService {
  private readonly rooms = new Map<string, Room>();

  create(dto: CreateRoomDto): string {
    const roomId = randomUUID();
    this.rooms.set(roomId, { ...dto, players: new Map() });
    return roomId;
  }

  findById(id: string): Room | undefined {
    return this.rooms.get(id);
  }
}
