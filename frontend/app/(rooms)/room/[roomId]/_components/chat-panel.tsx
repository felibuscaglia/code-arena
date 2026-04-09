"use client"

import { useEffect, useRef, useState } from "react"
import { AlertCircle, Send } from "lucide-react"
import { socket } from "@/lib/api/socket"
import { useRoom } from "@/lib/contexts/room"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { ScrollArea } from "@/components/ui/scroll-area"

interface Message {
  id: string
  playerName: string
  message: string
  timestamp: number
  error?: boolean
  type: "chat" | "system"
}

function formatTime(ts: number) {
  return new Date(ts).toLocaleTimeString([], {
    hour: "2-digit",
    minute: "2-digit",
  })
}

export function ChatPanel() {
  const { room, player } = useRoom()
  const [messages, setMessages] = useState<Message[]>([])
  const [draft, setDraft] = useState("")
  const bottomRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const handler = (msg: Omit<Message, "id" | "type">) =>
      setMessages((prev) => [
        ...prev,
        { ...msg, id: crypto.randomUUID(), type: "chat" },
      ])

    const joinHandler = (p: { displayName: string }) =>
      setMessages((prev) => [
        ...prev,
        {
          id: crypto.randomUUID(),
          playerName: "",
          message: `${p.displayName} joined the room`,
          timestamp: Date.now(),
          type: "system",
        },
      ])

    const leaveHandler = (_playerId: string) =>
      setMessages((prev) => [
        ...prev,
        {
          id: crypto.randomUUID(),
          playerName: "",
          message: "A player left the room",
          timestamp: Date.now(),
          type: "system",
        },
      ])

    socket.on("new-message", handler)
    socket.on("player-joined", joinHandler)
    socket.on("player-left", leaveHandler)
    return () => {
      socket.off("new-message", handler)
      socket.off("player-joined", joinHandler)
      socket.off("player-left", leaveHandler)
    }
  }, [])

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: "smooth" })
  }, [messages])

  if (!room || !player) return null

  const isOwnMessage = (m: Message) => m.playerName === player.displayName

  function send() {
    const text = draft.trim()
    if (!text || !player) return

    const msg: Message = {
      id: crypto.randomUUID(),
      playerName: player.displayName,
      message: text,
      timestamp: Date.now(),
      type: "chat",
    }

    setMessages((prev) => [...prev, msg])
    setDraft("")

    socket.timeout(5000).emit(
      "send-message",
      {
        roomId: room!.id,
        message: text,
        playerName: player.displayName,
      },
      (err: Error | null) => {
        if (err) {
          setMessages((prev) =>
            prev.map((m) => (m === msg ? { ...m, error: true } : m)),
          )
        }
      },
    )
  }

  return (
    <div className="flex flex-1 flex-col">
      <div className="border-b border-border/50 px-4 py-3">
        <h3 className="text-xs font-medium uppercase tracking-widest text-muted-foreground">
          Chat
        </h3>
      </div>
      <ScrollArea className="flex-1 px-4 py-3">
        <div className="flex flex-col gap-2">
          {messages.length === 0 && (
            <p className="py-8 text-center text-xs text-muted-foreground/50">
              No messages yet. Say hello!
            </p>
          )}
          {messages.map((m) => {
            if (m.type === "system") {
              return (
                <div
                  key={m.id}
                  className="py-1 text-center text-[11px] italic text-muted-foreground/60"
                >
                  {m.message}
                </div>
              )
            }

            const own = isOwnMessage(m)

            return (
              <div
                key={m.id}
                className={`flex flex-col gap-0.5 ${own ? "items-end" : "items-start"}`}
              >
                {!own && (
                  <span className="text-[10px] font-medium text-muted-foreground">
                    {m.playerName}
                  </span>
                )}
                <div
                  className={`max-w-[85%] rounded-lg px-3 py-1.5 text-sm ${
                    own
                      ? "bg-primary/15 text-foreground"
                      : "bg-muted/50 text-foreground"
                  }`}
                >
                  <span>{m.message}</span>
                  {m.error && (
                    <AlertCircle className="ml-1 inline size-3 text-danger" />
                  )}
                </div>
                <span className="text-[10px] text-muted-foreground/40">
                  {formatTime(m.timestamp)}
                </span>
              </div>
            )
          })}
          <div ref={bottomRef} />
        </div>
      </ScrollArea>
      <form
        onSubmit={(e) => {
          e.preventDefault()
          send()
        }}
        className="flex items-center gap-2 border-t border-border/50 p-3"
      >
        <Input
          value={draft}
          onChange={(e) => setDraft(e.target.value)}
          placeholder="Type a message..."
          className="flex-1"
        />
        <Button type="submit" size="icon" variant="ghost">
          <Send className="size-4" />
        </Button>
      </form>
    </div>
  )
}
