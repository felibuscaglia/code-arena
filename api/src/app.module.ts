import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_FILTER } from '@nestjs/core';
import { SentryGlobalFilter, SentryModule } from '@sentry/nestjs/setup';
import { AppController } from './app.controller';
import { RoomsModule } from './rooms/rooms.module';
import { SupabaseModule } from './supabase/supabase.module';
import { ChallengesModule } from './challenges/challenges.module';
import { SubmissionsModule } from './submissions/submissions.module';
import { Judge0Module } from './judge0/judge0.module';

@Module({
  imports: [
    SentryModule.forRoot(),
    ConfigModule.forRoot({ isGlobal: true }),
    RoomsModule,
    SupabaseModule,
    ChallengesModule,
    SubmissionsModule,
    Judge0Module,
  ],
  controllers: [AppController],
  providers: [
    {
      provide: APP_FILTER,
      useClass: SentryGlobalFilter,
    },
  ],
})
export class AppModule {}
