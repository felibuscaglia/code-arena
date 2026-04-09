"use client"

import { useEffect, useMemo, useState } from "react"
import { Loader2 } from "lucide-react"
import { rooms as roomsService, type RoomListItem } from "@/lib/api/services"
import { FilterBar } from "./filter-bar"
import { RoomCard } from "./room-card"
import { EmptyState } from "./empty-state"

export function BrowseRooms() {
  const [rooms, setRooms] = useState<RoomListItem[]>([])
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [difficulty, setDifficulty] = useState<string>("all")
  const [language, setLanguage] = useState<string>("all")

  useEffect(() => {
    let cancelled = false
    setIsLoading(true)
    roomsService
      .list()
      .then(({ data }) => {
        if (!cancelled) {
          setRooms(data)
          setError(null)
        }
      })
      .catch(() => {
        if (!cancelled) setError("Couldn't load rooms. Please try again.")
      })
      .finally(() => {
        if (!cancelled) setIsLoading(false)
      })
    return () => {
      cancelled = true
    }
  }, [])

  const filteredRooms = useMemo(() => {
    return rooms.filter((room) => {
      if (difficulty !== "all" && room.difficulty !== difficulty) return false
      if (language !== "all" && !room.languages.includes(language)) return false
      return true
    })
  }, [rooms, difficulty, language])

  return (
    <div className="flex flex-col gap-6">
      <FilterBar
        difficulty={difficulty}
        onDifficultyChange={setDifficulty}
        language={language}
        onLanguageChange={setLanguage}
      />

      {isLoading ? (
        <div className="flex items-center justify-center rounded-xl border border-border/40 bg-card/30 py-20">
          <Loader2 className="size-5 animate-spin text-muted-foreground" />
        </div>
      ) : error ? (
        <div className="flex items-center justify-center rounded-xl border border-destructive/30 bg-destructive/5 py-12 text-sm text-destructive">
          {error}
        </div>
      ) : filteredRooms.length === 0 ? (
        <EmptyState hasFilters={rooms.length > 0} />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2">
          {filteredRooms.map((room) => (
            <RoomCard key={room.id} room={room} />
          ))}
        </div>
      )}
    </div>
  )
}
