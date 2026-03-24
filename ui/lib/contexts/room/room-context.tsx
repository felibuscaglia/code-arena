"use client"

import { createContext, useEffect, useState } from "react"
import { isAxiosError } from "axios"
import { rooms, type Room } from "@/lib/api/services"

export class RoomError extends Error {
  status: number

  constructor(message: string, status: number) {
    super(message)
    this.status = status
  }
}

export interface RoomContextValue {
  room: Room | null
  isLoading: boolean
}

export const RoomContext = createContext<RoomContextValue | null>(null)

export function RoomProvider({
  roomId,
  children,
}: {
  roomId: string
  children: React.ReactNode
}) {
  const [room, setRoom] = useState<Room | null>(null)
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState<RoomError | null>(null)

  useEffect(() => {
    rooms
      .getById(roomId)
      .then((res) => setRoom(res.data))
      .catch((err) => {
        const status = isAxiosError(err) ? (err.response?.status ?? 500) : 500
        setError(new RoomError(err.message, status))
      })
      .finally(() => setIsLoading(false))
  }, [roomId])

  if (error) throw error

  return (
    <RoomContext.Provider value={{ room, isLoading }}>
      {children}
    </RoomContext.Provider>
  )
}
