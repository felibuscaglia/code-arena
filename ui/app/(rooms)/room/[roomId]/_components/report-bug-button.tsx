"use client"

import { useState } from "react"
import * as Sentry from "@sentry/nextjs"
import { Bug, Check } from "lucide-react"

import { useRoom } from "@/lib/contexts/room"
import { Button } from "@/components/ui/button"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"

export function ReportBugButton() {
  const { room, player, challenge } = useRoom()
  const [open, setOpen] = useState(false)
  const [description, setDescription] = useState("")
  const [submitted, setSubmitted] = useState(false)

  function handleSubmit() {
    if (!description.trim()) return

    Sentry.captureMessage("User bug report", {
      level: "warning",
      tags: {
        report_source: "room_bug_button",
        room_status: room?.status,
        room_id: room?.id,
        challenge_id: challenge?.id,
      },
      contexts: {
        report: {
          description,
          roomId: room?.id,
          roomStatus: room?.status,
          currentRound: room?.currentRound,
          roundCount: room?.roundCount,
          challengeId: challenge?.id,
          playerId: player?.id,
        },
      },
    })

    setSubmitted(true)
    setTimeout(() => {
      setOpen(false)
      setDescription("")
      setSubmitted(false)
    }, 1200)
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button variant="ghost" size="sm" className="gap-1.5">
          <Bug className="size-3.5" />
          <span className="hidden sm:inline">Report</span>
        </Button>
      </DialogTrigger>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>Report a bug</DialogTitle>
          <DialogDescription>
            Tell us what went wrong. We&apos;ll attach the room and round context automatically.
          </DialogDescription>
        </DialogHeader>

        <div className="flex flex-col gap-2">
          <Label htmlFor="bug-description">What happened?</Label>
          <Textarea
            id="bug-description"
            placeholder="My submission ran but never scored…"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            rows={5}
            disabled={submitted}
          />
        </div>

        <DialogFooter>
          {submitted ? (
            <Button disabled className="gap-1.5">
              <Check className="size-4" />
              Sent — thanks!
            </Button>
          ) : (
            <Button onClick={handleSubmit} disabled={!description.trim()}>
              Send report
            </Button>
          )}
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}
