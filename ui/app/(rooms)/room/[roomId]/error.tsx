"use client"

import Link from "next/link"
import { ArrowLeft, AlertCircle } from "lucide-react"
import { Button } from "@/components/ui/button"
import { LogoIcon } from "@/components/ui/logo"
import { RoomError } from "@/lib/contexts/room/room-context"

export default function RoomErrorPage({ error }: { error: Error }) {
  const isNotFound = error instanceof RoomError && error.status === 404

  return (
    <div className="bg-grid relative flex min-h-svh flex-col items-center justify-center px-6">
      <div
        aria-hidden="true"
        className="pointer-events-none absolute top-1/3 left-1/2 -translate-x-1/2 -translate-y-1/2"
      >
        <div className="h-[400px] w-[600px] rounded-full bg-danger/5 blur-[120px]" />
      </div>

      <div className="relative flex max-w-md flex-col items-center gap-6 text-center">
        <LogoIcon className="size-12 text-primary" />

        <div className="flex flex-col gap-3">
          <div className="flex items-center justify-center gap-2 text-danger">
            <AlertCircle className="size-5" />
            <h1 className="font-heading text-2xl font-bold tracking-tight sm:text-3xl">
              {isNotFound ? "Room not found" : "Unable to join room"}
            </h1>
          </div>
          <p className="text-sm text-muted-foreground">
            {isNotFound
              ? "This room doesn't exist or has already ended. Check the invite link and try again."
              : "Something went wrong. If you received an invite link, reach out to the room creator to get a new one."}
          </p>
        </div>

        <Button variant="outline" asChild>
          <Link href="/">
            <ArrowLeft data-icon="inline-start" />
            Back to home
          </Link>
        </Button>
      </div>
    </div>
  )
}
