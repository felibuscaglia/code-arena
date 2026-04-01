import { CreateRoomDto } from '../dto/create-room.dto';
import { RoomStatus } from '../enums';
import { Player } from './player.interface';
import { RoundState } from './round-state.interface';

export interface Room extends CreateRoomDto {
  players: Map<string, Player>;
  status: RoomStatus;
  hostToken: string;
  challenges: string[];
  currentRound: number;
  rounds: RoundState[];
}
