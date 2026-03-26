"use client"

import { useEffect, useState } from "react"

export function BattlePreview() {
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    const timer = setTimeout(() => setMounted(true), 200)
    return () => clearTimeout(timer)
  }, [])

  return (
    <div className="overflow-hidden rounded-xl border border-border/50 bg-card/80 shadow-2xl shadow-primary/5 backdrop-blur-sm">
      <div className="flex items-center gap-2 border-b border-border/50 bg-muted/30 px-4 py-2.5">
        <div className="flex gap-1.5">
          <div className="size-2 rounded-full bg-foreground/15" />
          <div className="size-2 rounded-full bg-foreground/15" />
          <div className="size-2 rounded-full bg-foreground/15" />
        </div>
        <span className="text-[10px] text-muted-foreground/50">
          battle — round 1 of 3
        </span>
      </div>
      <div className="space-y-3 p-4">
        <div className="flex items-center gap-3">
          <span className="size-1.5 rounded-full bg-success" />
          <span className="w-16 text-[11px] text-muted-foreground">you</span>
          <div className="h-1.5 flex-1 overflow-hidden rounded-full bg-muted">
            <div
              className="h-full rounded-full bg-success/80 transition-all duration-[1.5s] ease-out"
              style={{ width: mounted ? "72%" : "0%" }}
            />
          </div>
          <span className="w-8 text-right text-[10px] tabular-nums text-success">
            72%
          </span>
        </div>
        <div className="flex items-center gap-3">
          <span className="size-1.5 rounded-full bg-primary" />
          <span className="w-16 text-[11px] text-muted-foreground">rival</span>
          <div className="h-1.5 flex-1 overflow-hidden rounded-full bg-muted">
            <div
              className="h-full rounded-full bg-primary/80 transition-all duration-[1.5s] ease-out"
              style={{ width: mounted ? "48%" : "0%", transitionDelay: "0.3s" }}
            />
          </div>
          <span className="w-8 text-right text-[10px] tabular-nums text-primary">
            48%
          </span>
        </div>
      </div>
      <div className="border-t border-border/30 bg-background/60 p-4">
        <div className="mb-2 text-[10px] text-muted-foreground/40">
          solution.js
        </div>
        <div className="space-y-0.5 font-mono text-[11px] leading-relaxed">
          <div>
            <span className="text-primary">function</span>{" "}
            <span className="text-foreground/80">twoSum</span>
            <span className="text-muted-foreground">(nums, target) {"{"}</span>
          </div>
          <div className="pl-4">
            <span className="text-primary">const</span>{" "}
            <span className="text-foreground/80">seen</span>{" "}
            <span className="text-muted-foreground">= new Map();</span>
          </div>
          <div className="pl-4">
            <span className="text-primary">for</span>{" "}
            <span className="text-muted-foreground">
              (const [i, n] of nums.entries()) {"{"}
            </span>
          </div>
          <div className="flex items-center pl-8">
            <span className="text-primary">if</span>{" "}
            <span className="text-muted-foreground">
              (seen.has(target - n))
            </span>
            <span className="animate-blink ml-0.5 inline-block h-3.5 w-[5px] bg-primary/70" />
          </div>
        </div>
      </div>
    </div>
  )
}
