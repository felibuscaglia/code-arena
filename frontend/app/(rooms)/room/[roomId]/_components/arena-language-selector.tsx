"use client"

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"
import { useRoom } from "@/lib/contexts/room"

const LANGUAGE_LABELS: Record<string, string> = {
  javascript: "JavaScript",
  python: "Python",
}

interface ArenaLanguageSelectorProps {
  value: string
  onLanguageChange: (language: string) => void
}

export function ArenaLanguageSelector({ value, onLanguageChange }: ArenaLanguageSelectorProps) {
  const { room } = useRoom()
  const languages = room?.languages ?? []

  if (languages.length < 2) return null; 

  return (
    <Select value={value} onValueChange={onLanguageChange}>
      <SelectTrigger size="sm" className="w-[130px] text-xs">
        <SelectValue />
      </SelectTrigger>
      <SelectContent>
        {languages.map((lang) => (
          <SelectItem key={lang} value={lang}>
            {LANGUAGE_LABELS[lang] ?? lang}
          </SelectItem>
        ))}
      </SelectContent>
    </Select>
  )
}
