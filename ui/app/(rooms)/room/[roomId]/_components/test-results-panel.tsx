import { ScrollArea } from "@/components/ui/scroll-area"
import { CheckCircle2, XCircle, Minus } from "lucide-react"

interface TestCase {
  id: string
  name: string
  status: "pass" | "fail" | "pending"
  stdout?: string
  error?: string
}

const MOCK_RESULTS: TestCase[] = [
  {
    id: "tc-1",
    name: "Example 1",
    status: "pass",
    stdout: "[0, 1]",
  },
  {
    id: "tc-2",
    name: "Example 2",
    status: "fail",
    stdout: "[0, 2]",
    error: "Expected [1, 2] but got [0, 2]",
  },
  {
    id: "tc-3",
    name: "Example 3",
    status: "pending",
  },
]

const STATUS_ICON = {
  pass: <CheckCircle2 className="size-3.5 text-success" />,
  fail: <XCircle className="size-3.5 text-danger" />,
  pending: <Minus className="size-3.5 text-muted-foreground" />,
}

const STATUS_COLOR = {
  pass: "text-success",
  fail: "text-danger",
  pending: "text-muted-foreground",
}

export function TestResultsPanel() {
  const results = MOCK_RESULTS
  const passCount = results.filter((r) => r.status === "pass").length

  return (
    <div className="flex h-full flex-col border-t border-border/50">
      <div className="flex items-center justify-between border-b border-border/30 px-3 py-2">
        <span className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
          Test Results
        </span>
        <span className="font-mono text-xs text-muted-foreground">
          {passCount}/{results.length} passed
        </span>
      </div>
      <ScrollArea className="flex-1">
        <div className="space-y-1 p-2">
          {results.map((tc) => (
            <div
              key={tc.id}
              className="rounded-md border border-border/30 bg-muted/20 p-2.5"
            >
              <div className="flex items-center gap-2">
                {STATUS_ICON[tc.status]}
                <span className="text-xs font-medium">{tc.name}</span>
                <span
                  className={`ml-auto text-[10px] font-medium uppercase tracking-wider ${STATUS_COLOR[tc.status]}`}
                >
                  {tc.status}
                </span>
              </div>
              {tc.stdout && (
                <div className="mt-2 rounded bg-background/50 px-2.5 py-1.5 font-mono text-[11px] text-muted-foreground">
                  <span className="text-foreground/50">stdout: </span>
                  {tc.stdout}
                </div>
              )}
              {tc.error && (
                <div className="mt-1 rounded bg-danger/5 px-2.5 py-1.5 font-mono text-[11px] text-danger">
                  {tc.error}
                </div>
              )}
            </div>
          ))}
        </div>
      </ScrollArea>
    </div>
  )
}
