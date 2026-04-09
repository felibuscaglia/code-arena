import { Module } from '@nestjs/common';
import { ChallengesRepository } from './challenges.repository';
import { ChallengesService } from './challenges.service';

@Module({
  providers: [ChallengesService, ChallengesRepository],
  exports: [ChallengesService],
})
export class ChallengesModule {}
