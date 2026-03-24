import { CreateRoomDto } from '../dto/create-room.dto';

export interface Room extends CreateRoomDto {
  socketRoom: string;
}
