import {
  Avatar,
  AvatarFallback,
  AvatarGroup,
} from "@/components/ui/avatar"
import {
  Tooltip,
  TooltipContent,
  TooltipTrigger,
} from "@/components/ui/tooltip"

const PLAYERS = [
  { id: "1", name: "Felipe", initials: "FB" },
  { id: "2", name: "Alice", initials: "AL" },
  { id: "3", name: "Bob", initials: "BO" },
  { id: "4", name: "Charlie", initials: "CH" },
]

export function RoomPlayers() {
  return (
    <AvatarGroup>
      {PLAYERS.map((player) => (
        <Tooltip key={player.id}>
          <TooltipTrigger asChild>
            <Avatar className="transition-transform duration-200 hover:z-10 hover:-translate-y-1 hover:scale-110">
              <AvatarFallback>{player.initials}</AvatarFallback>
            </Avatar>
          </TooltipTrigger>
          <TooltipContent side="bottom">{player.name}</TooltipContent>
        </Tooltip>
      ))}
    </AvatarGroup>
  )
}
