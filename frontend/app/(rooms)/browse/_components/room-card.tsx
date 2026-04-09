import Link from "next/link"
import { ArrowRight, Clock, Layers, Users } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import type { RoomListItem } from "@/lib/api/services"

const DIFFICULTY_STYLES: Record<string, string> = {
  easy: "border-success/40 bg-success/10 text-success",
  medium: "border-warning/40 bg-warning/10 text-warning",
  hard: "border-danger/40 bg-danger/10 text-danger",
}

const LANGUAGE_LABELS: Record<string, { short: string; color: string }> = {
  javascript: { short: "JS", color: "text-warning" },
  python: { short: "PY", color: "text-[oklch(0.65_0.17_250)]" },
}

interface RoomCardProps {
  room: RoomListItem
}

export function RoomCard({ room }: RoomCardProps) {
  const playerCount = Object.keys(room.players).length
  const difficultyStyle =
    DIFFICULTY_STYLES[room.difficulty] ??
    "border-border/50 bg-muted/30 text-muted-foreground"
  const difficultyLabel =
    room.difficulty.charAt(0).toUpperCase() + room.difficulty.slice(1)

  return (
    <div className="group flex flex-col gap-4 rounded-xl border border-border/40 bg-card/50 p-5 backdrop-blur-sm transition-all hover:border-border hover:bg-muted/30 hover:shadow-lg hover:shadow-primary/5">
      {/* Header */}
      <div className="flex items-start justify-between gap-3">
        <h3 className="font-heading line-clamp-2 text-base font-semibold">
          {room.name}
        </h3>
        <Badge
          variant="outline"
          className={`shrink-0 capitalize ${difficultyStyle}`}
        >
          {difficultyLabel}
        </Badge>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-3 gap-3 text-xs">
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 text-muted-foreground">
            <Layers className="size-3.5" />
            Rounds
          </div>
          <div className="font-medium text-foreground">{room.roundCount}</div>
        </div>
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 text-muted-foreground">
            <Clock className="size-3.5" />
            Per round
          </div>
          <div className="font-medium text-foreground">{room.roundTime} min</div>
        </div>
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-1.5 text-muted-foreground">
            <Users className="size-3.5" />
            Players
          </div>
          <div className="font-medium text-foreground">
            {playerCount}/{room.maxPlayers}
          </div>
        </div>
      </div>

      {/* Languages */}
      <div className="flex flex-wrap items-center gap-1.5">
        {room.languages.map((lang) => {
          const meta = LANGUAGE_LABELS[lang]
          return (
            <span
              key={lang}
              className="inline-flex items-center gap-1.5 rounded-md border border-border/40 bg-muted/30 px-2 py-1 text-[11px]"
            >
              {meta && (
                <span className={`font-heading font-bold ${meta.color}`}>
                  {meta.short}
                </span>
              )}
              <span className="capitalize text-muted-foreground">{lang}</span>
            </span>
          )
        })}
      </div>

      {/* Join CTA */}
      <Button asChild className="mt-auto h-10 w-full">
        <Link href={`/room/${room.id}`}>
          Join
          <ArrowRight data-icon="inline-end" />
        </Link>
      </Button>
    </div>
  )
}
