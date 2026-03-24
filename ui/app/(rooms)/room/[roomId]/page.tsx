import { JoinRoomModal } from "./_components/join-room-modal"

export default async function RoomPage({
  params,
}: {
  params: Promise<{ roomId: string }>
}) {
  const { roomId } = await params

  return (
    <div>
      <JoinRoomModal roomId={roomId} />
      Room {roomId}
    </div>
  )
}
