"use client"

import { useState } from "react"
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"

const LANGUAGES = [
  { value: "javascript", label: "JavaScript" },
  { value: "python", label: "Python" },
]

interface ArenaLanguageSelectorProps {
  onLanguageChange?: (language: string) => void
}

export function ArenaLanguageSelector({ onLanguageChange }: ArenaLanguageSelectorProps) {
  const [language, setLanguage] = useState("javascript")

  function handleChange(value: string) {
    setLanguage(value)
    onLanguageChange?.(value)
  }

  return (
    <Select value={language} onValueChange={handleChange}>
      <SelectTrigger size="sm" className="w-[130px] text-xs">
        <SelectValue />
      </SelectTrigger>
      <SelectContent>
        {LANGUAGES.map((lang) => (
          <SelectItem key={lang.value} value={lang.value}>
            {lang.label}
          </SelectItem>
        ))}
      </SelectContent>
    </Select>
  )
}
