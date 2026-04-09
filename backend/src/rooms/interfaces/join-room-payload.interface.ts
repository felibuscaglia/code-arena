export interface JoinRoomPayload {
  roomId: string;
  displayName: string;
  avatar: string;
  hostToken?: string;
}
