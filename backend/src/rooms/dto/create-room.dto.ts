import {
  IsString,
  IsInt,
  IsIn,
  IsArray,
  ArrayMinSize,
  IsBoolean,
  Min,
  Max,
  IsNotEmpty,
} from 'class-validator';
import { type ChallengeDifficulty } from '../../supabase/types';
import { Constants } from '../../supabase/types/database.types';

const ALLOWED_LANGUAGES = ['javascript', 'python'];

export class CreateRoomDto {
  @IsString()
  @IsNotEmpty()
  name: string;

  @IsInt()
  @IsNotEmpty()
  @Min(1)
  @Max(10)
  roundCount: number;

  @IsIn([5, 10, 15, 20, 25, 30])
  @IsNotEmpty()
  roundTime: number;

  @IsIn(Constants.public.Enums.challenge_difficulty)
  @IsNotEmpty()
  difficulty: ChallengeDifficulty;

  @IsArray()
  @ArrayMinSize(1)
  @IsIn(ALLOWED_LANGUAGES, { each: true })
  languages: string[];

  @IsInt()
  @IsNotEmpty()
  @Min(2)
  @Max(8)
  maxPlayers: number;

  @IsBoolean()
  @IsNotEmpty()
  public: boolean;
}
