import Markdown from "react-markdown"
import { Badge } from "@/components/ui/badge"
import { ScrollArea } from "@/components/ui/scroll-area"
import { Separator } from "@/components/ui/separator"
import { Circle } from "lucide-react"
import { CountdownTimer } from "./countdown-timer"

const MOCK_PROBLEM = {
  title: "Two Sum",
  difficulty: "Medium" as const,
  round: 1,
  totalRounds: 3,
  timeSeconds: 900,
  description: `Given an array of integers \`nums\` and an integer \`target\`, return indices of the two numbers such that they add up to \`target\`.

You may assume that each input would have **exactly one solution**, and you may not use the same element twice.

You can return the answer in any order.`,
  examples: [
    {
      id: "example-1",
      input: "nums = [2,7,11,15], target = 9",
      output: "[0,1]",
      explanation: "Because nums[0] + nums[1] == 9, we return [0, 1].",
    },
    {
      id: "example-2",
      input: "nums = [3,2,4], target = 6",
      output: "[1,2]",
      explanation: undefined,
    },
    {
      id: "example-3",
      input: "nums = [3,3], target = 6",
      output: "[0,1]",
      explanation: undefined,
    },
  ],
  constraints: [
    "2 ≤ nums.length ≤ 10⁴",
    "-10⁹ ≤ nums[i] ≤ 10⁹",
    "-10⁹ ≤ target ≤ 10⁹",
    "Only one valid answer exists.",
  ],
}

const DIFFICULTY_STYLES = {
  Easy: "bg-success/15 text-success border-success/25",
  Medium: "bg-warning/15 text-warning border-warning/25",
  Hard: "bg-danger/15 text-danger border-danger/25",
}

export function ProblemPanel() {
  const problem = MOCK_PROBLEM

  return (
    <div className="flex h-full flex-col">
      {/* Header */}
      <div className="flex items-center justify-between border-b border-border/50 px-5 py-3">
        <div className="flex items-center gap-3">
          <div className="flex items-center gap-1.5 text-xs text-muted-foreground">
            <Circle className="size-2.5 fill-primary text-primary" />
            <span className="font-medium uppercase tracking-wider">
              Round {problem.round}/{problem.totalRounds}
            </span>
          </div>
          <Separator orientation="vertical" className="h-4" />
          <h2 className="font-heading text-base font-bold">{problem.title}</h2>
          <Badge className={DIFFICULTY_STYLES[problem.difficulty]}>
            {problem.difficulty}
          </Badge>
        </div>
        <CountdownTimer totalSeconds={problem.timeSeconds} />
      </div>

      {/* Body */}
      <ScrollArea className="flex-1">
        <div className="p-5 pb-8">
          {/* Description */}
          <Markdown
            components={{
              p: ({ children }) => (
                <p className="mb-4 text-sm leading-relaxed text-foreground/90 last:mb-0">
                  {children}
                </p>
              ),
              code: ({ children }) => (
                <code className="rounded bg-muted px-1.5 py-0.5 font-mono text-[13px] text-primary">
                  {children}
                </code>
              ),
              strong: ({ children }) => (
                <strong className="font-semibold text-foreground">{children}</strong>
              ),
            }}
          >
            {problem.description}
          </Markdown>

          <Separator className="my-6" />

          {/* Examples */}
          <div className="space-y-4">
            {problem.examples.map((example, idx) => (
              <div
                key={example.id}
                className="overflow-hidden rounded-lg border border-border/50 bg-muted/30"
              >
                <div className="border-b border-border/30 px-4 py-2">
                  <span className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
                    Example {idx + 1}
                  </span>
                </div>
                <div className="space-y-2 px-4 py-3 font-mono text-[13px]">
                  <div className="flex gap-2">
                    <span className="shrink-0 text-muted-foreground">Input:</span>
                    <span className="text-foreground">{example.input}</span>
                  </div>
                  <div className="flex gap-2">
                    <span className="shrink-0 text-muted-foreground">Output:</span>
                    <span className="font-semibold text-primary">{example.output}</span>
                  </div>
                  {example.explanation && (
                    <div className="flex gap-2 pt-1 text-muted-foreground">
                      <span className="shrink-0">Note:</span>
                      <span className="italic">{example.explanation}</span>
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>

          <Separator className="my-6" />

          {/* Constraints */}
          <div>
            <h3 className="mb-3 text-xs font-medium uppercase tracking-wider text-muted-foreground">
              Constraints
            </h3>
            <ul className="space-y-1.5">
              {problem.constraints.map((constraint) => (
                <li
                  key={constraint}
                  className="flex items-start gap-2 font-mono text-[13px] text-foreground/80"
                >
                  <span className="mt-1.5 block size-1 shrink-0 rounded-full bg-muted-foreground/50" />
                  {constraint}
                </li>
              ))}
            </ul>
          </div>
        </div>
      </ScrollArea>
    </div>
  )
}
