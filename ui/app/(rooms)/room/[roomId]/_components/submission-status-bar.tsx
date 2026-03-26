import { Users } from "lucide-react"

interface SubmissionStatusBarProps {
  submitted: number
  total: number
}

export function SubmissionStatusBar({ submitted, total }: SubmissionStatusBarProps) {
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
