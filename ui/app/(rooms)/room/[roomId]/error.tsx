"use client"

import Link from "next/link"
import { ArrowLeft } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Logo } from "@/components/ui/logo"
import { RoomError } from "@/lib/contexts/room/room-context"

export default function RoomErrorPage({ error }: { error: Error }) {
  const isNotFound =
    error instanceof RoomError && error.status === 404

  return (
    <div className="bg-grid relative flex min-h-svh flex-col items-center justify-center px-6">
      <div
        aria-hidden="true"
        className="pointer-events-none absolute top-1/3 left-1/2 -translate-x-1/2 -translate-y-1/2"
      >
        <div className="h-[400px] w-[600px] rounded-full bg-destructive/5 blur-[120px]" />
      </div>

      <div className="relative flex max-w-md flex-col items-center gap-8 text-center">
        <Logo className="opacity-60" />

        <div className="flex flex-col gap-3">
          <h1 className="font-heading text-3xl font-bold tracking-tight sm:text-4xl">
            {isNotFound ? "Room not found" : "Unable to join room"}
          </h1>
          <p className="text-muted-foreground">
            {isNotFound
              ? "This room is no longer available. It may have been closed or the link is invalid."
              : "Something went wrong on our end. If you received an invite link, reach out to the room creator to get a new one."}
          </p>
        </div>

        <Button size="lg" asChild>
          <Link href="/">
            <ArrowLeft data-icon="inline-start" />
            Back to Home
          </Link>
        </Button>
      </div>
    </div>
  )
}
