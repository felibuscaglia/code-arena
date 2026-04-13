import { ImageResponse } from "next/og"

export const size = { width: 32, height: 32 }
export const contentType = "image/png"

export default function Icon() {
  return new ImageResponse(
    (
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          background: "transparent",
        }}
      >
        <svg width="32" height="32" viewBox="0 0 32 32" fill="none">
          {/* Rounded badge with opposing chevron cutouts */}
          <path
            fillRule="evenodd"
            clipRule="evenodd"
            d="M6 0H26A6 6 0 0132 6V26A6 6 0 0126 32H6A6 6 0 010 26V6A6 6 0 016 0ZM7 7L17 16L7 25V21L13 16L7 11ZM25 7L15 16L25 25V21L19 16L25 11Z"
            fill="#6d5bf7"
          />
        </svg>
      </div>
    ),
    { ...size },
  )
}
