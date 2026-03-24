import { RoomProvider } from "@/lib/contexts/room"
import { JoinRoomModal } from "./_components/join-room-modal"
import { RoomInfoSummary } from "./_components/room-info-summary"

export default async function RoomPage({
  params,
}: {
  params: Promise<{ roomId: string }>
}) {
  const { roomId } = await params

  return (
    <RoomProvider roomId={roomId}>
      <div className="flex flex-col gap-6 p-6">
        <JoinRoomModal roomId={roomId} />
        <RoomInfoSummary />
      </div>
    </RoomProvider>
  )
}
