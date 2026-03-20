"use client"

import { useState } from "react"
import { ArrowRight } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group"
import { Checkbox } from "@/components/ui/checkbox"
import { Switch } from "@/components/ui/switch"
import { ToggleGroup, ToggleGroupItem } from "@/components/ui/toggle-group"
import { Separator } from "@/components/ui/separator"

type Mode = "ffa" | "2v2"

const TIME_LIMITS = [
  { value: "5", label: "5 min" },
  { value: "10", label: "10 min" },
  { value: "15", label: "15 min" },
  { value: "20", label: "20 min" },
  { value: "30", label: "30 min" },
]

const DIFFICULTIES = [
  { value: "easy", label: "Easy" },
  { value: "medium", label: "Medium" },
  { value: "hard", label: "Hard" },
  { value: "mixed", label: "Mixed" },
]

const ROUNDS = Array.from({ length: 10 }, (_, i) => String(i + 1))

const MAX_PLAYERS = Array.from({ length: 7 }, (_, i) => String(i + 2))

export function RoomConfigForm() {
  const [mode, setMode] = useState<Mode>("ffa")

  return (
    <form onSubmit={(e) => e.preventDefault()} className="flex flex-col gap-10">
      {/* ── Basics ── */}
      <section className="flex flex-col gap-6">
        <div>
          <h2 className="font-heading text-sm font-semibold">Basics</h2>
          <p className="text-xs text-muted-foreground">
            Name your room and pick a game mode.
          </p>
        </div>

        <div className="grid gap-6 sm:grid-cols-2">
          <fieldset className="flex flex-col gap-2 sm:col-span-2">
            <Label htmlFor="room-name">Room name</Label>
            <Input
              id="room-name"
              placeholder="e.g. Friday Night Showdown"
              className="h-9"
            />
          </fieldset>

          <fieldset className="flex flex-col gap-2 sm:col-span-2">
            <Label>Mode</Label>
            <ToggleGroup
              type="single"
              variant="outline"
              value={mode}
              onValueChange={(v) => {
                if (v) setMode(v as Mode)
              }}
              className="w-full sm:w-fit"
            >
              <ToggleGroupItem value="ffa" className="flex-1 sm:flex-none sm:px-6">
                Free for All
              </ToggleGroupItem>
              <ToggleGroupItem value="2v2" className="flex-1 sm:flex-none sm:px-6">
                2v2 Teams
              </ToggleGroupItem>
            </ToggleGroup>
            <p className="text-xs text-muted-foreground">
              {mode === "ffa" &&
                "Every coder for themselves. Top the leaderboard to win."}
              {mode === "2v2" &&
                "Team up with a partner. Shared editor and voice chat included."}
            </p>
          </fieldset>
        </div>
      </section>

      <Separator />

      {/* ── Match Settings ── */}
      <section className="flex flex-col gap-6">
        <div>
          <h2 className="font-heading text-sm font-semibold">Match settings</h2>
          <p className="text-xs text-muted-foreground">
            Control the pace and challenge level.
          </p>
        </div>

        <div className="grid gap-6 sm:grid-cols-2">
          <fieldset className="flex flex-col gap-2">
            <Label htmlFor="rounds">Rounds</Label>
            <Select defaultValue="3">
              <SelectTrigger id="rounds" className="w-full">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {ROUNDS.map((r) => (
                  <SelectItem key={r} value={r}>
                    {r} {r === "1" ? "round" : "rounds"}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </fieldset>

          <fieldset className="flex flex-col gap-2">
            <Label htmlFor="time-limit">Time per round</Label>
            <Select defaultValue="10">
              <SelectTrigger id="time-limit" className="w-full">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {TIME_LIMITS.map((t) => (
                  <SelectItem key={t.value} value={t.value}>
                    {t.label}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </fieldset>

          <fieldset className="flex flex-col gap-3 sm:col-span-2">
            <Label>Difficulty</Label>
            <RadioGroup defaultValue="medium" className="flex gap-6">
              {DIFFICULTIES.map((d) => (
                <div key={d.value} className="flex items-center gap-2">
                  <RadioGroupItem value={d.value} id={`diff-${d.value}`} />
                  <Label
                    htmlFor={`diff-${d.value}`}
                    className="text-sm font-normal"
                  >
                    {d.label}
                  </Label>
                </div>
              ))}
            </RadioGroup>
            <p className="text-xs text-muted-foreground">
              Mixed picks a random difficulty each round.
            </p>
          </fieldset>
        </div>
      </section>

      <Separator />

      {/* ── Preferences ── */}
      <section className="flex flex-col gap-6">
        <div>
          <h2 className="font-heading text-sm font-semibold">Preferences</h2>
          <p className="text-xs text-muted-foreground">
            Languages, visibility, and player limits.
          </p>
        </div>

        <div className="grid gap-6 sm:grid-cols-2">
          <fieldset className="flex flex-col gap-3">
            <Label>Languages</Label>
            <div className="flex gap-6">
              <div className="flex items-center gap-2">
                <Checkbox id="lang-js" defaultChecked />
                <Label htmlFor="lang-js" className="text-sm font-normal">
                  JavaScript
                </Label>
              </div>
              <div className="flex items-center gap-2">
                <Checkbox id="lang-py" />
                <Label htmlFor="lang-py" className="text-sm font-normal">
                  Python
                </Label>
              </div>
            </div>
            <p className="text-xs text-muted-foreground">
              Languages available for solving challenges.
            </p>
          </fieldset>

          {mode !== "2v2" && (
            <fieldset className="flex flex-col gap-2">
              <Label htmlFor="max-players">Max players</Label>
              <Select defaultValue="4">
                <SelectTrigger id="max-players" className="w-full">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  {MAX_PLAYERS.map((p) => (
                    <SelectItem key={p} value={p}>
                      {p} players
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </fieldset>
          )}

          <fieldset className="flex items-center justify-between gap-4 sm:col-span-2">
            <div className="flex flex-col gap-1">
              <Label htmlFor="visibility">Public room</Label>
              <p className="text-xs text-muted-foreground">
                Public rooms appear in Browse and anyone can join. Private rooms
                require an invite link.
              </p>
            </div>
            <Switch id="visibility" />
          </fieldset>
        </div>
      </section>

      <Separator />

      {/* Submit */}
      <Button type="submit" size="lg" className="w-full sm:w-auto sm:self-end">
        Create Room
        <ArrowRight data-icon="inline-end" />
      </Button>
    </form>
  )
}
