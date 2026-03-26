"use client"

import { Label } from "@/components/ui/label"

const DIFFICULTIES = [
  { value: "easy", label: "Easy", color: "border-success/40 bg-success/10 text-success hover:bg-success/15", activeColor: "border-success bg-success/20 text-success ring-2 ring-success/30 glow-success" },
  { value: "medium", label: "Medium", color: "border-warning/40 bg-warning/10 text-warning hover:bg-warning/15", activeColor: "border-warning bg-warning/20 text-warning ring-2 ring-warning/30" },
  { value: "hard", label: "Hard", color: "border-danger/40 bg-danger/10 text-danger hover:bg-danger/15", activeColor: "border-danger bg-danger/20 text-danger ring-2 ring-danger/30" },
  { value: "mixed", label: "Mixed", color: "border-primary/40 bg-primary/10 text-primary hover:bg-primary/15", activeColor: "border-primary bg-primary/20 text-primary ring-2 ring-primary/30 glow-primary" },
] as const

interface DifficultySelectorProps {
  value: string
  onValueChange: (value: string) => void
}

export function DifficultySelector({ value, onValueChange }: DifficultySelectorProps) {
  return (
    <fieldset className="flex flex-col gap-3">
      <Label>Difficulty</Label>
      <div className="flex gap-2">
        {DIFFICULTIES.map((d) => (
          <button
            key={d.value}
            type="button"
            onClick={() => onValueChange(d.value)}
            className={`flex-1 rounded-lg border px-3 py-2 text-sm font-medium transition-all ${
              value === d.value ? d.activeColor : d.color
            }`}
          >
            {d.label}
          </button>
        ))}
      </div>
      <p className="text-xs text-muted-foreground">
        Mixed picks a random difficulty each round.
      </p>
    </fieldset>
  )
}
