"use client"

import { Users } from "lucide-react"
import { useRoom } from "@/lib/contexts/room"

export function SubmissionStatusBar() {
  const { room } = useRoom()

  if (!room) return null

  const currentRound = room.rounds[room.currentRound - 1]
  const submitted = currentRound?.submittedPlayerIds.length ?? 0
  const total = room.players.size

  return (
    <div className="flex items-center gap-2 text-xs text-muted-foreground">
      <Users className="size-3.5" />
      <span>
        <span className="font-semibold text-foreground">{submitted}</span> of{" "}
        <span className="font-semibold text-foreground">{total}</span> players
        have submitted
      </span>
      <div className="ml-1 flex gap-0.5">
        {Array.from({ length: total }).map((_, i) => (
          <div
            key={`sub-dot-${i}`}
            className={`size-1.5 rounded-full transition-colors ${
              i < submitted ? "bg-success" : "bg-muted-foreground/30"
            }`}
          />
        ))}
      </div>
    </div>
  )
}
