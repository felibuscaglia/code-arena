"use client"

import { useState } from "react"
import { ChevronLeft, ChevronRight, Trophy } from "lucide-react"
import { Avatar, AvatarFallback } from "@/components/ui/avatar"
import { Button } from "@/components/ui/button"
import { useRoom } from "@/lib/contexts/room"

export function CumulativeStandingsSidebar() {
  const { room, player, roundHistory } = useRoom()
  const [isOpen, setIsOpen] = useState(true)

  if (!room || roundHistory.length === 0) return null

  const totals = new Map<string, number>()
  for (const result of roundHistory) {
    for (const [playerId, score] of Object.entries(result.scores)) {
      totals.set(playerId, (totals.get(playerId) ?? 0) + score.total)
    }
  }

  const standings = Array.from(totals.entries())
    .map(([playerId, total]) => {
      const p = room.players.get(playerId)
      return {
        playerId,
        displayName: p?.displayName ?? "Unknown",
        avatar: p?.avatar ?? "?",
        total,
      }
    })
    .sort((a, b) => b.total - a.total)

  return (
    <aside
      className={`relative flex shrink-0 flex-col border-l border-border/50 bg-card/30 backdrop-blur-sm transition-[width] duration-300 ease-in-out ${
        isOpen ? "w-72" : "w-10"
      }`}
    >
      <Button
        variant="ghost"
        size="icon"
        onClick={() => setIsOpen((prev) => !prev)}
        className="absolute -left-3 top-4 size-6 rounded-full border border-border/50 bg-background shadow-sm"
        aria-label={isOpen ? "Collapse cumulative standings" : "Expand cumulative standings"}
      >
        {isOpen ? <ChevronRight className="size-3.5" /> : <ChevronLeft className="size-3.5" />}
      </Button>

      {isOpen ? (
        <div className="flex flex-1 flex-col overflow-hidden">
          <div className="flex items-center gap-2 border-b border-border/50 px-4 py-3">
            <Trophy className="size-3.5 text-amber-400" />
            <h3 className="text-sm font-semibold text-foreground">Session Standings</h3>
          </div>
          <div className="flex-1 overflow-y-auto px-2 py-2">
            <ul className="flex flex-col gap-1">
              {standings.map((entry, index) => {
                const isLeader = index === 0
                const isMe = entry.playerId === player?.id
                return (
                  <li
                    key={entry.playerId}
                    className={`flex items-center gap-2 rounded-md px-2 py-2 ${
                      isLeader
                        ? "bg-amber-400/5"
                        : isMe
                          ? "bg-success/5"
                          : ""
                    }`}
                  >
                    <span
                      className={`inline-flex size-5 shrink-0 items-center justify-center rounded-full text-[10px] font-bold ${
                        isLeader
                          ? "bg-amber-400/20 text-amber-400"
                          : "text-muted-foreground"
                      }`}
                    >
                      {index + 1}
                    </span>
                    <Avatar className={isLeader ? "ring-2 ring-amber-400/50" : ""}>
                      <AvatarFallback className="text-xs">{entry.avatar}</AvatarFallback>
                    </Avatar>
                    <div className="flex min-w-0 flex-1 flex-col">
                      <span
                        className={`truncate text-xs font-medium ${
                          isLeader ? "text-amber-400" : "text-foreground"
                        }`}
                      >
                        {entry.displayName}
                        {isMe && <span className="ml-1 text-[10px] text-success">(You)</span>}
                      </span>
                      <span className="text-[10px] text-muted-foreground">
                        {roundHistory.length} round{roundHistory.length === 1 ? "" : "s"}
                      </span>
                    </div>
                    <span
                      className={`font-mono text-sm font-bold tabular-nums ${
                        isLeader ? "text-amber-400" : "text-foreground"
                      }`}
                    >
                      {(entry.total * 100).toFixed(1)}
                    </span>
                  </li>
                )
              })}
            </ul>
          </div>
        </div>
      ) : (
        <div className="flex flex-1 items-start justify-center pt-4">
          <Trophy className="size-4 text-amber-400" />
        </div>
      )}
    </aside>
  )
}
