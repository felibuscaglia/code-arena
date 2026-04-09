"use client"

import { useState, useEffect } from "react"
import { Timer } from "lucide-react"

interface CountdownTimerProps {
  totalSeconds: number
}

export function CountdownTimer({ totalSeconds }: CountdownTimerProps) {
  const [remaining, setRemaining] = useState(totalSeconds)

  useEffect(() => {
    const interval = setInterval(() => {
      setRemaining((prev) => (prev > 0 ? prev - 1 : 0))
    }, 1000)
    return () => clearInterval(interval)
  }, [])

  const minutes = Math.floor(remaining / 60)
  const seconds = remaining % 60
  const progress = remaining / totalSeconds
  const isUrgent = remaining <= 60
  const isCritical = remaining <= 30

  return (
    <div
      className={`flex items-center gap-2.5 rounded-lg border px-3 py-2 font-mono text-sm tabular-nums transition-all duration-500 ${
        isCritical
          ? "border-danger/40 bg-danger/10 text-danger"
          : isUrgent
            ? "border-warning/40 bg-warning/10 text-warning"
            : "border-border/50 bg-muted/50 text-foreground"
      }`}
    >
      <Timer
        className={`size-4 ${isCritical ? "animate-pulse" : ""}`}
      />
      <div className="flex items-baseline gap-0.5">
        <span className="text-lg font-bold leading-none">
          {String(minutes).padStart(2, "0")}
        </span>
        <span className={`text-lg font-bold leading-none ${isCritical ? "animate-blink" : ""}`}>
          :
        </span>
        <span className="text-lg font-bold leading-none">
          {String(seconds).padStart(2, "0")}
        </span>
      </div>
      <div className="ml-1 h-1.5 w-16 overflow-hidden rounded-full bg-border/50">
        <div
          className={`h-full rounded-full transition-all duration-1000 ease-linear ${
            isCritical
              ? "bg-danger"
              : isUrgent
                ? "bg-warning"
                : "bg-primary"
          }`}
          style={{ width: `${progress * 100}%` }}
        />
      </div>
    </div>
  )
}
