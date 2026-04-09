/**
 * Extracts a room id from either a raw room id string or a full room URL
 * (e.g. https://example.com/room/abc123). Returns null if no valid room id
 * can be parsed.
 */
export function parseRoomIdFromInput(input: string): string | null {
  const trimmed = input.trim()
  if (!trimmed) return null

  try {
    const url = new URL(trimmed)
    const match = url.pathname.match(/\/room\/([^/?#]+)/)
    if (match?.[1]) return match[1]
    return null
  } catch {
    return null
  }
}
