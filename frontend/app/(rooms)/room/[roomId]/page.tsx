import { RoomProvider } from "@/lib/contexts/room"
import { JoinRoomModal } from "./_components/join-room-modal"
import { RoomInfoSummary } from "./_components/room-info-summary"
import { RoomContent } from "./_components/room-content"

export default async function RoomPage({
  params,
}: {
  params: Promise<{ roomId: string }>
}) {
  const { roomId } = await params

  return (
    <RoomProvider roomId={roomId}>
      <div className="flex h-svh flex-col bg-grid">
        <JoinRoomModal roomId={roomId} />
        <RoomInfoSummary roomId={roomId} />
        <RoomContent roomId={roomId} />
      </div>
    </RoomProvider>
  )
}
