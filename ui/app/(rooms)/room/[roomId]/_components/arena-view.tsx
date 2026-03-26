"use client"

import {
  ResizablePanelGroup,
  ResizablePanel,
  ResizableHandle,
} from "@/components/ui/resizable"
import { ProblemPanel } from "./problem-panel"
import { CodeEditorPanel } from "./code-editor-panel"

export function ArenaView() {
  return (
    <ResizablePanelGroup orientation="horizontal" className="flex-1">
      <ResizablePanel defaultSize={40} minSize={25}>
        <ProblemPanel />
      </ResizablePanel>
      <ResizableHandle withHandle />
      <ResizablePanel defaultSize={60} minSize={30}>
        <CodeEditorPanel />
      </ResizablePanel>
    </ResizablePanelGroup>
  )
}
