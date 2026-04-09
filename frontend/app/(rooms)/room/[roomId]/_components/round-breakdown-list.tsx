"use client"

import { useState } from "react"
import { ChevronDown, ChevronRight, Trophy } from "lucide-react"
import { Avatar, AvatarFallback } from "@/components/ui/avatar"
import { useRoom } from "@/lib/contexts/room"

export function RoundBreakdownList() {
  const { room, roundHistory, player } = useRoom()
  const [openRound, setOpenRound] = useState<number | null>(0)

  if (!room || roundHistory.length === 0) return null

  return (
    <div className="w-full max-w-4xl rounded-lg border border-border/50 bg-card/50 backdrop-blur-sm">
      <div className="border-b border-border/50 px-4 py-3">
        <h2 className="text-sm font-semibold text-foreground">Round-by-round breakdown</h2>
      </div>
      <ul className="divide-y divide-border/50">
        {roundHistory.map((result, index) => {
          const isOpen = openRound === index
          const ranked = Object.entries(result.scores)
            .map(([playerId, score]) => {
              const p = room.players.get(playerId)
              return {
                playerId,
                displayName: p?.displayName ?? "Unknown",
                avatar: p?.avatar ?? "?",
                total: score.total,
              }
            })
            .sort((a, b) => b.total - a.total)
          const winnerEntry = ranked[0]

          return (
            <li key={`round-${index}`}>
              <button
                type="button"
                onClick={() => setOpenRound(isOpen ? null : index)}
                aria-expanded={isOpen}
                className="flex w-full items-center justify-between gap-3 px-4 py-3 text-left transition-colors hover:bg-muted/40"
              >
                <div className="flex items-center gap-3">
                  {isOpen ? (
                    <ChevronDown className="size-4 text-muted-foreground" />
                  ) : (
                    <ChevronRight className="size-4 text-muted-foreground" />
                  )}
                  <span className="text-sm font-semibold text-foreground">
                    Round {index + 1}
                  </span>
                </div>
                <div className="flex items-center gap-2 text-xs text-muted-foreground">
                  <Trophy className="size-3.5 text-amber-400" />
                  <span className="text-amber-400">{winnerEntry?.displayName}</span>
                  <span className="font-mono text-foreground tabular-nums">
                    {((winnerEntry?.total ?? 0) * 100).toFixed(1)}
                  </span>
                </div>
              </button>
              {isOpen && (
                <ul className="flex flex-col gap-1 px-4 pb-4">
                  {ranked.map((entry, rank) => {
                    const isMe = entry.playerId === player?.id
                    const isFirst = rank === 0
                    return (
                      <li
                        key={entry.playerId}
                        className={`flex items-center gap-3 rounded-md px-3 py-2 ${
                          isFirst ? "bg-amber-400/5" : isMe ? "bg-success/5" : ""
                        }`}
                      >
                        <span
                          className={`inline-flex size-5 shrink-0 items-center justify-center rounded-full text-[10px] font-bold ${
                            isFirst ? "bg-amber-400/20 text-amber-400" : "text-muted-foreground"
                          }`}
                        >
                          {rank + 1}
                        </span>
                        <Avatar className={isFirst ? "ring-2 ring-amber-400/50" : ""}>
                          <AvatarFallback className="text-xs">{entry.avatar}</AvatarFallback>
                        </Avatar>
                        <span
                          className={`flex-1 text-sm font-medium ${
                            isFirst ? "text-amber-400" : "text-foreground"
                          }`}
                        >
                          {entry.displayName}
                          {isMe && <span className="ml-1 text-[10px] text-success">(You)</span>}
                        </span>
                        <span
                          className={`font-mono text-sm font-bold tabular-nums ${
                            isFirst ? "text-amber-400" : "text-foreground"
                          }`}
                        >
                          {(entry.total * 100).toFixed(1)}
                        </span>
                      </li>
                    )
                  })}
                </ul>
              )}
            </li>
          )
        })}
      </ul>
    </div>
  )
}
