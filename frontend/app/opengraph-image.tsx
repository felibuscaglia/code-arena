import { ImageResponse } from "next/og"

export const alt = "CodePvP — Real-Time Competitive Coding Battles"
export const size = { width: 1200, height: 630 }
export const contentType = "image/png"

export default async function OgImage() {
  return new ImageResponse(
    (
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          justifyContent: "center",
          backgroundColor: "#09090f",
          position: "relative",
          overflow: "hidden",
        }}
      >
        {/* Background grid dots */}
        <div
          style={{
            position: "absolute",
            inset: 0,
            backgroundImage:
              "radial-gradient(circle, rgba(109,91,247,0.045) 1px, transparent 1px)",
            backgroundSize: "28px 28px",
            display: "flex",
          }}
        />

        {/* Wide ambient glow */}
        <div
          style={{
            position: "absolute",
            top: "40%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            width: 800,
            height: 500,
            borderRadius: "50%",
            background:
              "radial-gradient(ellipse, rgba(109,91,247,0.12) 0%, rgba(109,91,247,0.03) 50%, transparent 72%)",
            display: "flex",
          }}
        />

        {/* Tight logo glow */}
        <div
          style={{
            position: "absolute",
            top: "36%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            width: 280,
            height: 280,
            borderRadius: "50%",
            background:
              "radial-gradient(circle, rgba(109,91,247,0.22) 0%, transparent 70%)",
            display: "flex",
          }}
        />

        {/* Logo mark — battle badge */}
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            marginBottom: 36,
          }}
        >
          <svg width="120" height="120" viewBox="0 0 32 32" fill="none">
            {/* Rounded badge with opposing chevron cutouts */}
            <path
              fillRule="evenodd"
              clipRule="evenodd"
              d="M6 0H26A6 6 0 0132 6V26A6 6 0 0126 32H6A6 6 0 010 26V6A6 6 0 016 0ZM7 7L17 16L7 25V21L13 16L7 11ZM25 7L15 16L25 25V21L19 16L25 11Z"
              fill="#6d5bf7"
            />
          </svg>
        </div>

        {/* Brand name */}
        <div
          style={{
            display: "flex",
            alignItems: "baseline",
            marginBottom: 16,
          }}
        >
          <span
            style={{
              fontSize: 78,
              fontWeight: 800,
              color: "white",
              letterSpacing: "-3px",
              lineHeight: 1,
            }}
          >
            Code
          </span>
          <span
            style={{
              fontSize: 78,
              fontWeight: 800,
              color: "#6d5bf7",
              letterSpacing: "-3px",
              lineHeight: 1,
            }}
          >
            PvP
          </span>
        </div>

        {/* Tagline */}
        <div
          style={{
            fontSize: 22,
            color: "rgba(255,255,255,0.45)",
            letterSpacing: "3px",
            textTransform: "uppercase",
            display: "flex",
          }}
        >
          Real-Time Competitive Coding Battles
        </div>

        {/* Feature pills */}
        <div
          style={{
            display: "flex",
            gap: 14,
            marginTop: 44,
          }}
        >
          {["Head-to-Head", "Live Scoring", "No Signup"].map((label) => (
            <div
              key={label}
              style={{
                display: "flex",
                alignItems: "center",
                padding: "8px 24px",
                borderRadius: 999,
                border: "1px solid rgba(109,91,247,0.2)",
                backgroundColor: "rgba(109,91,247,0.06)",
                fontSize: 15,
                color: "rgba(255,255,255,0.45)",
                letterSpacing: "0.5px",
              }}
            >
              {label}
            </div>
          ))}
        </div>

        {/* Domain */}
        <div
          style={{
            position: "absolute",
            bottom: 28,
            fontSize: 15,
            color: "rgba(255,255,255,0.18)",
            letterSpacing: "3px",
            textTransform: "uppercase",
            display: "flex",
          }}
        >
          codepvp.com
        </div>
      </div>
    ),
    { ...size },
  )
}
