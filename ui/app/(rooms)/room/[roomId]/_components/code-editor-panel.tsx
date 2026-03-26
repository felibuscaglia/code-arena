"use client"

import { useState } from "react"
import Editor from "@monaco-editor/react"
import { Button } from "@/components/ui/button"
import { Play, Send } from "lucide-react"
import { ArenaLanguageSelector } from "./arena-language-selector"
import { TestResultsPanel } from "./test-results-panel"
import { SubmissionStatusBar } from "./submission-status-bar"
import {
  ResizablePanelGroup,
  ResizablePanel,
  ResizableHandle,
} from "@/components/ui/resizable"

const DEFAULT_CODE: Record<string, string> = {
  javascript: `/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
function twoSum(nums, target) {
  // Write your solution here
}`,
  python: `def two_sum(nums: list[int], target: int) -> list[int]:
    # Write your solution here
    pass`,
}

const LANGUAGE_MAP: Record<string, string> = {
  javascript: "javascript",
  python: "python",
}

export function CodeEditorPanel() {
  const [language, setLanguage] = useState("javascript")
  const [code, setCode] = useState(DEFAULT_CODE.javascript)

  function handleLanguageChange(lang: string) {
    setLanguage(lang)
    setCode(DEFAULT_CODE[lang] ?? "")
  }

  return (
    <div className="flex h-full flex-col">
      {/* Toolbar */}
      <div className="flex items-center justify-between border-b border-border/50 px-3 py-2">
        <ArenaLanguageSelector onLanguageChange={handleLanguageChange} />
        <div className="flex items-center gap-2">
          <Button variant="outline" size="sm">
            <Play className="size-3.5" />
            Run Tests
          </Button>
          <Button size="sm">
            <Send className="size-3.5" />
            Submit
          </Button>
        </div>
      </div>

      {/* Editor + Test Results (vertically resizable) */}
      <ResizablePanelGroup orientation="vertical" className="flex-1">
        <ResizablePanel defaultSize={65} minSize={30}>
          <Editor
            language={LANGUAGE_MAP[language]}
            value={code}
            onChange={(value) => setCode(value ?? "")}
            options={{
              fontSize: 13,
              fontFamily: "var(--font-mono), JetBrains Mono, monospace",
              minimap: { enabled: false },
              lineNumbers: "on",
              tabSize: 2,
              automaticLayout: true,
              scrollBeyondLastLine: false,
              padding: { top: 12, bottom: 12 },
              suggestOnTriggerCharacters: true,
              quickSuggestions: true,
              wordBasedSuggestions: "currentDocument",
              renderLineHighlight: "line",
              cursorBlinking: "smooth",
              smoothScrolling: true,
              bracketPairColorization: { enabled: true },
            }}
          />
        </ResizablePanel>
        <ResizableHandle withHandle />
        <ResizablePanel defaultSize={35} minSize={15}>
          <TestResultsPanel />
        </ResizablePanel>
      </ResizablePanelGroup>

      {/* Status bar */}
      <div className="border-t border-border/50 px-3 py-2">
        <SubmissionStatusBar submitted={3} total={6} />
      </div>
    </div>
  )
}
