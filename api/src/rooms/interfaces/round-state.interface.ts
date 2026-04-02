import { ScoreBreakdown } from '../../submissions/interfaces';

export interface RoundState {
  startedAt: number;
  submittedPlayerIds: string[];
  scores: Map<string, Promise<ScoreBreakdown>>;
}
