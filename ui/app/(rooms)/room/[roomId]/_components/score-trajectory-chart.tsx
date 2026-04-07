"use client"

import { useMemo } from "react"
import { useRoom } from "@/lib/contexts/room"

const CHART_COLORS = [
  "#fbbf24",
  "#60a5fa",
  "#34d399",
  "#f472b6",
  "#a78bfa",
  "#fb923c",
  "#22d3ee",
  "#f87171",
] as const

const WIDTH = 720
const HEIGHT = 260
const PADDING = { top: 20, right: 20, bottom: 32, left: 40 } as const
const INNER_W = WIDTH - PADDING.left - PADDING.right
const INNER_H = HEIGHT - PADDING.top - PADDING.bottom

export function ScoreTrajectoryChart() {
  const { room, gameResult, roundHistory } = useRoom()

  const trajectories = useMemo(() => {
    if (!room || !gameResult) return []
    return gameResult.standings.map(({ playerId }, i) => {
      const points: number[] = []
      let cumulative = 0
      for (const round of roundHistory) {
        cumulative += round.scores[playerId]?.total ?? 0
        points.push(cumulative)
      }
      return {
        playerId,
        displayName: room.players.get(playerId)?.displayName ?? "Unknown",
        points,
        color: CHART_COLORS[i % CHART_COLORS.length],
      }
    })
  }, [room, gameResult, roundHistory])

  if (trajectories.length === 0 || trajectories[0].points.length === 0) return null

  const roundCount = trajectories[0].points.length
  const maxValue = Math.max(1e-6, ...trajectories.flatMap((t) => t.points))

  function xFor(i: number) {
    if (roundCount === 1) return PADDING.left + INNER_W / 2
    return PADDING.left + (i / (roundCount - 1)) * INNER_W
  }

  function yFor(v: number) {
    return PADDING.top + INNER_H - (v / maxValue) * INNER_H
  }

  return (
    <div className="w-full max-w-4xl rounded-lg border border-border/50 bg-card/50 backdrop-blur-sm">
      <div className="border-b border-border/50 px-4 py-3">
        <h2 className="text-sm font-semibold text-foreground">Score trajectory</h2>
      </div>
      <div className="overflow-x-auto px-4 py-4">
        <svg
          viewBox={`0 0 ${WIDTH} ${HEIGHT}`}
          className="w-full"
          role="img"
          aria-label="Cumulative score per round for each player"
        >
          {[0, 0.25, 0.5, 0.75, 1].map((t) => {
            const y = PADDING.top + INNER_H * (1 - t)
            return (
              <g key={`grid-${t}`}>
                <line
                  x1={PADDING.left}
                  x2={PADDING.left + INNER_W}
                  y1={y}
                  y2={y}
                  stroke="currentColor"
                  className="text-border/40"
                  strokeDasharray="2 4"
                />
                <text
                  x={PADDING.left - 6}
                  y={y + 3}
                  textAnchor="end"
                  className="fill-muted-foreground text-[10px]"
                >
                  {(maxValue * t * 100).toFixed(0)}
                </text>
              </g>
            )
          })}

          {Array.from({ length: roundCount }).map((_, i) => (
            <text
              key={`xlabel-${i}`}
              x={xFor(i)}
              y={HEIGHT - 10}
              textAnchor="middle"
              className="fill-muted-foreground text-[10px]"
            >
              R{i + 1}
            </text>
          ))}

          {trajectories.map((t) => {
            const d = t.points
              .map((p, i) => `${i === 0 ? "M" : "L"} ${xFor(i)} ${yFor(p)}`)
              .join(" ")
            return (
              <g key={`line-${t.playerId}`}>
                <path
                  d={d}
                  fill="none"
                  stroke={t.color}
                  strokeWidth={2}
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
                {t.points.map((p, i) => (
                  <circle
                    key={`pt-${t.playerId}-${i}`}
                    cx={xFor(i)}
                    cy={yFor(p)}
                    r={3}
                    fill={t.color}
                  />
                ))}
              </g>
            )
          })}
        </svg>

        <ul className="mt-3 flex flex-wrap items-center justify-center gap-x-4 gap-y-2">
          {trajectories.map((t) => (
            <li
              key={`legend-${t.playerId}`}
              className="flex items-center gap-2 text-xs text-muted-foreground"
            >
              <span
                className="inline-block size-2.5 rounded-full"
                style={{ backgroundColor: t.color }}
                aria-hidden
              />
              <span>{t.displayName}</span>
            </li>
          ))}
        </ul>
      </div>
    </div>
  )
}
