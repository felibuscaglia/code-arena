import { Injectable } from '@nestjs/common';
import { randomUUID } from 'crypto';
import { CreateRoomDto } from './dto/create-room.dto';
import { Player } from './interfaces/player.interface';
import { Room } from './interfaces/room.interface';
import { RoomStatus } from './enums';
import { ChallengesService } from '../challenges/challenges.service';

const ROOM_MAX_LIFETIME_MS = 5.5 * 60 * 60 * 1000;

@Injectable()
export class RoomsService {
  private readonly rooms = new Map<string, Room>();
  private readonly playerRoomBySocketId = new Map<string, string>();

  constructor(private readonly challengesService: ChallengesService) {}

  async create(dto: CreateRoomDto): Promise<{ roomId: string; hostToken: string }> {
    const roomId = randomUUID();
    const hostToken = randomUUID();
    const challenges = await this.challengesService.getChallengesByDifficulty(
      dto.difficulty,
      dto.roundCount,
    );
    const room: Room = {
      ...dto,
      players: new Map(),
      status: RoomStatus.WAITING,
      hostToken,
      challenges,
      currentRound: 1,
      rounds: [],
    };
    room.cleanupTimeout = setTimeout(
      () => this.delete(roomId),
      ROOM_MAX_LIFETIME_MS,
    );
    this.rooms.set(roomId, room);
    return { roomId, hostToken };
  }

  findById(id: string): Room | undefined {
    return this.rooms.get(id);
  }

  findPublicWaiting(): (Room & { id: string })[] {
    // Eventually, this logic needs to be reworked. Should work well with up to ~10,000 rooms.
    const result: (Room & { id: string })[] = [];
    for (const [id, room] of this.rooms) {
      if (room.public && room.status === RoomStatus.WAITING) {
        result.push({ ...room, id });
      }
    }
    return result;
  }

  addPlayer(
    roomId: string,
    displayName: string,
    avatar: string,
    socketId: string,
    hostToken?: string,
  ): Player | undefined {
    const room = this.rooms.get(roomId);
    if (!room) return undefined;

    const player: Player = {
      id: socketId,
      displayName,
      avatar,
      isHost: hostToken === room.hostToken,
    };

    room.players.set(player.id, player);
    this.playerRoomBySocketId.set(socketId, roomId);
    return player;
  }

  removePlayer(roomId: string, playerId: string): boolean {
    const room = this.rooms.get(roomId);
    if (!room) return false;
    this.playerRoomBySocketId.delete(playerId);
    return room.players.delete(playerId);
  }

  delete(roomId: string): void {
    const room = this.rooms.get(roomId);
    if (room?.cleanupTimeout) clearTimeout(room.cleanupTimeout);
    this.rooms.delete(roomId);
  }

  updateStatus(roomId: string, status: RoomStatus): void {
    const room = this.rooms.get(roomId);
    if (!room) return;
    room.status = status;
  }

  startRound(
    roomId: string,
  ): void {
    const room = this.rooms.get(roomId);
    if (!room) return;

    room.rounds.push({
      startedAt: Date.now(),
      submittedPlayerIds: [],
      scores: new Map(),
      resolvedScores: new Map(),
    });
  }

  findRoomByPlayerId(playerId: string): string | undefined {
    return this.playerRoomBySocketId.get(playerId);
  }
}
