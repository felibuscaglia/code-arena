import { Injectable } from '@nestjs/common';
import { SupabaseService } from '../supabase/supabase.service';

@Injectable()
export class ChallengesRepository {
  constructor(private readonly supabaseService: SupabaseService) {}

  getById(id: string, includeExamples: boolean = false) {
    const select = includeExamples ? '*, examples(*)' : '*';
    return this.supabaseService.findOne('challenges', { id }, select);
  }
}
