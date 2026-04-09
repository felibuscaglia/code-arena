import { SubmissionResult } from './submission-result.interface';

export interface ScoreParams {
  result: SubmissionResult;
  code: string;
  roundStartedAt: number;
  submittedAt: number;
  roundTime: number;
}
