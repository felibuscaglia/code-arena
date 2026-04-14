import {
  Body,
  Controller,
  Get,
  NotFoundException,
  Param,
  Post,
} from '@nestjs/common';
import { CreateRoomDto } from './dto/create-room.dto';
import { RoomsService } from './rooms.service';

@Controller('rooms')
export class RoomsController {
  constructor(private readonly roomsService: RoomsService) {}

  @Post()
  create(@Body() dto: CreateRoomDto) {
    return this.roomsService.create(dto);
  }

  @Get()
  list() {
    return this.roomsService.findPublicWaiting().map((room) => {
      const {
        hostToken: _hostToken,
        challenges: _challenges,
        nextRoundTimeout: _nextRoundTimeout,
        rounds: _rounds,
        cleanupTimeout: _cleanupTimeout,
        ...rest
      } = room;
      return {
        ...rest,
        players: Object.fromEntries(room.players),
      };
    });
  }

  @Get(':roomId')
  getById(@Param('roomId') roomId: string) {
    const room = this.roomsService.findById(roomId);

    if (!room) throw new NotFoundException('Room not found.');

    const {
      nextRoundTimeout: _nextRoundTimeout,
      rounds,
      cleanupTimeout: _cleanupTimeout,
      ...rest
    } = room;
    return {
      ...rest,
      players: Object.fromEntries(room.players),
      rounds: rounds.map(({ timeout: _timeout, ...round }) => round),
    };
  }
}
