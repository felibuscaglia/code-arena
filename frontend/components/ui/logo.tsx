import { cn } from "@/lib/utils"

function LogoIcon({ className, ...props }: React.ComponentProps<"svg">) {
  return (
    <svg
      viewBox="0 0 32 32"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={cn("size-8", className)}
      aria-hidden="true"
      {...props}
    >
      {/* Rounded badge with opposing chevron cutouts */}
      <path
        fillRule="evenodd"
        clipRule="evenodd"
        d="M6 0H26A6 6 0 0132 6V26A6 6 0 0126 32H6A6 6 0 010 26V6A6 6 0 016 0ZM7 7L17 16L7 25V21L13 16L7 11ZM25 7L15 16L25 25V21L19 16L25 11Z"
        fill="currentColor"
        className="text-primary"
      />
    </svg>
  )
}

function Logo({
  className,
  iconClassName,
  ...props
}: React.ComponentProps<"div"> & { iconClassName?: string }) {
  return (
    <div
      className={cn("flex items-center gap-2", className)}
      {...props}
    >
      <LogoIcon className={iconClassName} />
      <span className="font-heading text-lg font-bold tracking-tight">
        Code<span className="text-primary">PvP</span>
      </span>
    </div>
  )
}

export { Logo, LogoIcon }
