import Link from "next/link"
import { Globe, Plus } from "lucide-react"
import { Button } from "@/components/ui/button"

interface EmptyStateProps {
  hasFilters: boolean
}

export function EmptyState({ hasFilters }: EmptyStateProps) {
  return (
    <div className="flex flex-col items-center gap-4 rounded-xl border border-dashed border-border/50 bg-card/30 px-6 py-16 text-center">
      <div className="flex size-12 items-center justify-center rounded-full bg-primary/10">
        <Globe className="size-5 text-primary" />
      </div>
      <div className="flex flex-col gap-1">
        <h3 className="font-heading text-base font-semibold">
          {hasFilters ? "No rooms match your filters" : "No public rooms yet"}
        </h3>
        <p className="max-w-sm text-sm text-muted-foreground">
          {hasFilters
            ? "Try loosening your filters or check back in a moment."
            : "Be the first to start a battle — create a public room and others will be able to join you here."}
        </p>
      </div>
      <Button asChild size="sm" className="mt-2">
        <Link href="/create">
          <Plus className="size-4" />
          Create a room
        </Link>
      </Button>
    </div>
  )
}
