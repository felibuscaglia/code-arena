import { api } from "./client"

export interface CreateRoomPayload {
  name: string
  mode: "ffa" | "2v2"
  rounds: number
  roundTime: number
  difficulty: string
  languages: string[]
  maxPlayers?: number
  public: boolean
}

export const rooms = {
  create: (payload: CreateRoomPayload) =>
    api.post<{ roomId: string }>("/rooms", payload),
}
