import { Crown } from "lucide-react"
import { Avatar, AvatarFallback, AvatarBadge } from "@/components/ui/avatar"
import type { Player } from "@/lib/api/services"

interface PlayerSlotProps {
  player?: Player
  isCurrentPlayer?: boolean
}

export function PlayerSlot({ player, isCurrentPlayer }: PlayerSlotProps) {
  if (!player) {
    return (
      <div className="flex flex-col items-center gap-2 rounded-lg border border-dashed border-muted-foreground/20 bg-muted/5 p-4">
        <Avatar size="lg" className="border-2 border-dashed border-muted-foreground/20">
          <AvatarFallback className="bg-transparent text-lg text-muted-foreground/20">
            ?
          </AvatarFallback>
        </Avatar>
        <span className="dot-pulse inline-flex gap-0.5">
          <span className="inline-block size-1 rounded-full bg-muted-foreground/30" />
          <span className="inline-block size-1 rounded-full bg-muted-foreground/30" />
          <span className="inline-block size-1 rounded-full bg-muted-foreground/30" />
        </span>
      </div>
    )
  }

  return (
    <div
      className={`flex animate-in flex-col items-center gap-2 rounded-lg border p-4 duration-300 fade-in slide-in-from-bottom-2 ${
        isCurrentPlayer
          ? "border-success/40 bg-success/5 glow-success"
          : "border-border/50 bg-card/50"
      }`}
    >
      <Avatar size="lg" className={isCurrentPlayer ? "ring-2 ring-success/50" : ""}>
        <AvatarFallback className="text-lg">{player.avatar}</AvatarFallback>
        {player.isHost && (
          <AvatarBadge className="bg-warning text-warning-foreground">
            <Crown className="size-2" />
          </AvatarBadge>
        )}
      </Avatar>
      <div className="flex flex-col items-center gap-0.5">
        <span className="max-w-[80px] truncate text-xs font-medium text-foreground">
          {player.displayName}
        </span>
        {isCurrentPlayer && (
          <span className="text-[10px] text-success">You</span>
        )}
        {player.isHost && !isCurrentPlayer && (
          <span className="text-[10px] text-warning">Host</span>
        )}
      </div>
    </div>
  )
}
