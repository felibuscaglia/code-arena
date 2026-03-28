import { api } from "./client"
import type { CreateRoomPayload, Room } from "./interfaces"

export type { CreateRoomPayload, Room, RoomStatus, Player, Challenge, Example } from "./interfaces"

export const rooms = {
  create: (payload: CreateRoomPayload) =>
    api.post<{ roomId: string; hostToken: string }>("/rooms", payload),
  getById: (roomId: string) => api.get<Room>(`/rooms/${roomId}`),
}
