import { RoomMode } from '../enums/room-mode.enum';
import { RoomDifficulty } from '../enums/room-difficulty.enum';
export declare class CreateRoomDto {
    name: string;
    mode: RoomMode;
    rounds: number;
    roundTime: number;
    difficulty: RoomDifficulty;
    languages: string[];
    maxPlayers?: number;
    public: boolean;
}
