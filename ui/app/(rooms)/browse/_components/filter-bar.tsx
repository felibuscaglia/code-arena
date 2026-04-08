import { SlidersHorizontal } from "lucide-react"
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"
import { Label } from "@/components/ui/label"

const DIFFICULTY_OPTIONS = [
  { value: "all", label: "All difficulties" },
  { value: "easy", label: "Easy" },
  { value: "medium", label: "Medium" },
  { value: "hard", label: "Hard" },
]

const LANGUAGE_OPTIONS = [
  { value: "all", label: "All languages" },
  { value: "javascript", label: "JavaScript" },
  { value: "python", label: "Python" },
]

interface FilterBarProps {
  difficulty: string
  onDifficultyChange: (value: string) => void
  language: string
  onLanguageChange: (value: string) => void
}

export function FilterBar({
  difficulty,
  onDifficultyChange,
  language,
  onLanguageChange,
}: FilterBarProps) {
  return (
    <div className="flex flex-col gap-3 rounded-xl border border-border/40 bg-card/50 p-4 backdrop-blur-sm sm:flex-row sm:items-end">
      <div className="flex items-center gap-2 text-xs font-medium text-muted-foreground sm:mb-2.5">
        <SlidersHorizontal className="size-3.5" />
        Filter
      </div>

      <div className="flex flex-1 flex-col gap-1.5">
        <Label htmlFor="filter-difficulty" className="text-xs">
          Difficulty
        </Label>
        <Select value={difficulty} onValueChange={onDifficultyChange}>
          <SelectTrigger id="filter-difficulty" className="w-full">
            <SelectValue />
          </SelectTrigger>
          <SelectContent>
            {DIFFICULTY_OPTIONS.map((option) => (
              <SelectItem key={option.value} value={option.value}>
                {option.label}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>

      <div className="flex flex-1 flex-col gap-1.5">
        <Label htmlFor="filter-language" className="text-xs">
          Language
        </Label>
        <Select value={language} onValueChange={onLanguageChange}>
          <SelectTrigger id="filter-language" className="w-full">
            <SelectValue />
          </SelectTrigger>
          <SelectContent>
            {LANGUAGE_OPTIONS.map((option) => (
              <SelectItem key={option.value} value={option.value}>
                {option.label}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>
    </div>
  )
}
