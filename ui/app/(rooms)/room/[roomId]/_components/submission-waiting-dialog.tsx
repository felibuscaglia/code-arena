"use client"

import { useState, useEffect } from "react"
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
} from "@/components/ui/dialog"
import { Users, Timer } from "lucide-react"
import { useRoom } from "@/lib/contexts/room"

const WAITING_MESSAGES = [
  "Sit tight, the results are brewing...",
  "Your code is in the arena now!",
  "Waiting for the other gladiators...",
  "Fingers crossed, you nailed it!",
  "The judges are deliberating...",
  "Time to stretch while you wait!",
]

interface SubmissionWaitingDialogProps {
  open: boolean
}

export function SubmissionWaitingDialog({ open }: SubmissionWaitingDialogProps) {
  const { room } = useRoom()
  const [messageIndex, setMessageIndex] = useState(0)
  const [remaining, setRemaining] = useState(0)

  const currentRound = room?.rounds[room.currentRound - 1]
  const submitted = currentRound?.submittedPlayerIds.length ?? 0
  const total = room?.players.size ?? 0
  const totalSeconds = (room?.roundTime ?? 0) * 60

  // Calculate and tick the countdown
  useEffect(() => {
    if (!open || !currentRound) return

    function tick() {
      const elapsed = Math.floor((Date.now() - currentRound!.startedAt) / 1000)
      setRemaining(Math.max(0, totalSeconds - elapsed))
    }

    tick()
    const interval = setInterval(tick, 1000)
    return () => clearInterval(interval)
  }, [open, currentRound, totalSeconds])

  // Rotate waiting messages
  useEffect(() => {
    if (!open) return
    setMessageIndex(Math.floor(Math.random() * WAITING_MESSAGES.length))
    const interval = setInterval(() => {
      setMessageIndex((prev) => (prev + 1) % WAITING_MESSAGES.length)
    }, 4000)
    return () => clearInterval(interval)
  }, [open])

  const minutes = Math.floor(remaining / 60)
  const seconds = remaining % 60

  return (
    <Dialog open={open}>
      <DialogContent
        showCloseButton={false}
        className="sm:max-w-md"
        onPointerDownOutside={(e) => e.preventDefault()}
        onEscapeKeyDown={(e) => e.preventDefault()}
      >
        <DialogHeader className="items-center text-center">
          {/* Checkmark animation */}
          <div className="mx-auto mb-2 flex size-16 items-center justify-center rounded-full bg-success/10">
            <svg
              className="size-10 text-success"
              viewBox="0 0 52 52"
              fill="none"
              stroke="currentColor"
              strokeWidth="3"
              strokeLinecap="round"
              strokeLinejoin="round"
            >
              <circle
                cx="26"
                cy="26"
                r="23"
                className="animate-[check-circle_0.4s_ease-in-out_forwards]"
                style={{
                  strokeDasharray: 145,
                  strokeDashoffset: 145,
                }}
              />
              <path
                d="M16 27l7 7 13-13"
                className="animate-[check-mark_0.3s_ease-in-out_0.4s_forwards]"
                style={{
                  strokeDasharray: 30,
                  strokeDashoffset: 30,
                }}
              />
            </svg>
          </div>

          <DialogTitle className="text-lg">Solution Submitted!</DialogTitle>
          <DialogDescription>
            Your code has been locked in. Now we wait...
          </DialogDescription>
        </DialogHeader>

        {/* Countdown timer */}
        <div className="flex flex-col items-center gap-4 py-2">
          <div className="flex items-center gap-2 rounded-lg border border-border/50 bg-muted/50 px-4 py-2.5 font-mono">
            <Timer className="size-4 text-muted-foreground" />
            <span className="text-2xl font-bold tabular-nums">
              {String(minutes).padStart(2, "0")}
              <span className="animate-blink">:</span>
              {String(seconds).padStart(2, "0")}
            </span>
            <span className="text-xs text-muted-foreground">remaining</span>
          </div>

          {/* Submission tracker */}
          <div className="flex flex-col items-center gap-2">
            <div className="flex items-center gap-2 text-sm text-muted-foreground">
              <Users className="size-4" />
              <span>
                <span className="font-semibold text-foreground">
                  {submitted}
                </span>{" "}
                of{" "}
                <span className="font-semibold text-foreground">{total}</span>{" "}
                players have submitted
              </span>
            </div>
            <div className="flex gap-1.5">
              {Array.from({ length: total }).map((_, i) => (
                <div
                  key={`waiting-dot-${i}`}
                  className={`size-2.5 rounded-full transition-all duration-500 ${
                    i < submitted
                      ? "scale-100 bg-success"
                      : "scale-90 bg-muted-foreground/25"
                  }`}
                />
              ))}
            </div>
          </div>

          {/* Fun rotating message */}
          <p
            key={messageIndex}
            className="animate-in fade-in slide-in-from-bottom-1 text-center text-sm text-muted-foreground italic duration-300"
          >
            {WAITING_MESSAGES[messageIndex]}
          </p>
        </div>
      </DialogContent>
    </Dialog>
  )
}
