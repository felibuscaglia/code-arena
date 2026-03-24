import { CreateRoomDto } from '../dto/create-room.dto';
import { Player } from './player.interface';

export interface Room extends CreateRoomDto {
  players: Map<string, Player>;
}
