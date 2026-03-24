"use client"

import { useRoom } from "@/lib/contexts/room"
import { Badge } from "@/components/ui/badge"
import { Separator } from "@/components/ui/separator"
import {
  Swords,
  RotateCw,
  Timer,
  Signal,
} from "lucide-react"
import { RoomPlayers } from "./room-players"
import type { Room } from "@/lib/api/services"

function getItems(room: Room) {
  return [
    { icon: Swords, label: "Mode", value: room.mode === "ffa" ? "Free for All" : "2v2 Teams" },
    { icon: RotateCw, label: "Rounds", value: room.rounds },
    { icon: Timer, label: "Time Limit", value: `${room.roundTime} min` },
    { icon: Signal, label: "Difficulty", value: room.difficulty },
  ]
}

export function RoomInfoSummary() {
  const { room, isLoading } = useRoom()

  if (isLoading || !room) return null

  const items = getItems(room)

  return (
    <div className="flex items-center justify-between rounded-lg border bg-card px-5 py-3 text-sm text-muted-foreground">
      <div className="flex items-center gap-4">
        {items.map((item, i) => (
          <div key={item.label} className="flex items-center gap-4">
            {i > 0 && (
              <Separator orientation="vertical" className="h-4" />
            )}
            <div className="flex items-center gap-2">
              <item.icon className="size-4" />
              <span>{item.label}</span>
              <Badge variant="secondary">{item.value}</Badge>
            </div>
          </div>
        ))}
      </div>
      <RoomPlayers />
    </div>
  )
}
