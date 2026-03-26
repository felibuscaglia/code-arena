"use client"

import { Label } from "@/components/ui/label"

const LANGUAGES = [
  { value: "javascript", label: "JavaScript", short: "JS", color: "text-warning" },
  { value: "python", label: "Python", short: "PY", color: "text-[oklch(0.65_0.17_250)]" },
] as const

interface LanguageSelectorProps {
  value: string[]
  onToggle: (lang: string, checked: boolean) => void
}

export function LanguageSelector({ value, onToggle }: LanguageSelectorProps) {
  return (
    <fieldset className="flex flex-col gap-3">
      <Label>Languages</Label>
      <div className="flex gap-2">
        {LANGUAGES.map((lang) => {
          const selected = value.includes(lang.value)
          return (
            <button
              key={lang.value}
              type="button"
              onClick={() => onToggle(lang.value, !selected)}
              className={`flex items-center gap-2 rounded-lg border px-4 py-2.5 text-sm transition-all ${
                selected
                  ? "border-primary/50 bg-primary/10 ring-2 ring-primary/20"
                  : "border-border/50 bg-card/50 hover:border-border hover:bg-muted/30"
              }`}
            >
              <span className={`font-heading text-xs font-bold ${lang.color}`}>
                {lang.short}
              </span>
              <span className={selected ? "text-foreground font-medium" : "text-muted-foreground"}>
                {lang.label}
              </span>
            </button>
          )
        })}
      </div>
      <p className="text-xs text-muted-foreground">
        Languages available for solving challenges.
      </p>
    </fieldset>
  )
}
