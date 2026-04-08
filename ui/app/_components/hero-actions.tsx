"use client"

import { useState, useRef, useEffect } from "react"
import { useRouter } from "next/navigation"
import { ArrowRight, Plus, Users, Globe, X } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import Link from "next/link"
import { parseRoomIdFromInput } from "@/lib/helpers/room"

export function HeroActions() {
  const router = useRouter()
  const [joinOpen, setJoinOpen] = useState(false)
  const [code, setCode] = useState("")
  const [error, setError] = useState<string | null>(null)
  const inputRef = useRef<HTMLInputElement>(null)

  useEffect(() => {
    if (joinOpen) {
      inputRef.current?.focus()
    }
  }, [joinOpen])

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    const roomId = parseRoomIdFromInput(code)
    if (!roomId) {
      setError("Please paste a valid room link.")
      return
    }
    router.push(`/room/${roomId}`)
  }

  function closeJoin() {
    setJoinOpen(false)
    setCode("")
    setError(null)
  }

  return (
    <div className="flex w-full max-w-lg flex-col gap-3">
      {/* Primary action */}
      <Button size="lg" className="glow-primary h-12 w-full text-sm" asChild>
        <Link href="/create">
          <Plus className="size-4" />
          Create Room
        </Link>
      </Button>

      {!joinOpen ? (
        <div className="flex gap-3">
          <Button
            variant="outline"
            size="lg"
            className="h-12 flex-1 text-sm"
            onClick={() => setJoinOpen(true)}
          >
            <Users className="size-4" />
            Join Room
          </Button>

          <Button
            variant="outline"
            size="lg"
            className="h-12 flex-1 text-sm"
            asChild
          >
            <Link href="/browse">
              <Globe className="size-4" />
              Browse Rooms
            </Link>
          </Button>
        </div>
      ) : (
        <form onSubmit={handleSubmit} className="flex flex-col gap-1.5">
          <div className="flex w-full overflow-hidden rounded-lg border border-border bg-background">
            <div className="relative flex-1">
              <Input
                ref={inputRef}
                value={code}
                onChange={(e) => {
                  setCode(e.target.value)
                  if (error) setError(null)
                }}
                placeholder="Paste room link"
                className="h-12 rounded-none border-0 px-4 pr-9 text-sm shadow-none focus-visible:ring-0"
              />
              <button
                type="button"
                onClick={closeJoin}
                className="absolute top-1/2 right-3 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                aria-label="Cancel"
              >
                <X className="size-3.5" />
              </button>
            </div>
            <Button
              type="submit"
              size="lg"
              disabled={!code.trim()}
              className="h-12 rounded-l-none"
            >
              Join
              <ArrowRight data-icon="inline-end" />
            </Button>
          </div>
          {error && (
            <p className="px-1 text-xs text-danger" role="alert">
              {error}
            </p>
          )}
        </form>
      )}
    </div>
  )
}
