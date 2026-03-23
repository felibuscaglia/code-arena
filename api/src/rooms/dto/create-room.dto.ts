import {
  IsString,
  IsEnum,
  IsInt,
  IsIn,
  IsArray,
  ArrayMinSize,
  IsBoolean,
  Min,
  Max,
  IsOptional,
  ValidateIf,
} from 'class-validator';
import { RoomMode } from '../enums/room-mode.enum';
import { RoomDifficulty } from '../enums/room-difficulty.enum';

const ALLOWED_LANGUAGES = ['javascript', 'python'];

export class CreateRoomDto {
  @IsString()
  name: string;

  @IsEnum(RoomMode)
  mode: RoomMode;

  @IsInt()
  @Min(1)
  @Max(10)
  rounds: number;

  @IsIn([5, 10, 15, 20, 25, 30])
  roundTime: number;

  @IsEnum(RoomDifficulty)
  difficulty: RoomDifficulty;

  @IsArray()
  @ArrayMinSize(1)
  @IsIn(ALLOWED_LANGUAGES, { each: true })
  languages: string[];

  @ValidateIf((o) => o.mode === RoomMode.FFA)
  @IsInt()
  @Min(2)
  @Max(8)
  @IsOptional()
  maxPlayers?: number;

  @IsBoolean()
  public: boolean;
}
