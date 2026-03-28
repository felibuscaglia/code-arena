export interface CreateRoomPayload {
  name: string
  rounds: number
  roundTime: number
  difficulty: string
  languages: string[]
  maxPlayers?: number
  public: boolean
}

export type RoomStatus = "waiting" | "in_progress" | "finished"

export interface Room {
  id: string
  name: string
  rounds: number
  roundTime: number
  difficulty: string
  languages: string[]
  maxPlayers?: number
  public: boolean
  players: Map<string, Player>
  status: RoomStatus
  currentRound: number
}

export interface Player {
  id: string
  displayName: string
  avatar: string
  isHost: boolean
}

export interface Example {
  id: string
  challenge_id: string
  input: string
  output: string
  explanation: string | null
}

export interface Challenge {
  id: string
  title: string
  description: string
  difficulty: "easy" | "medium" | "hard"
  starter_code: Record<string, string>
  test_cases: unknown
  constraints: string[] | null
  tags: string[] | null
  created_at: string
  examples: Example[]
}
