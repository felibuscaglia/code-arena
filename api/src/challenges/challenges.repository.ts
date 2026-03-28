import { Injectable } from '@nestjs/common';
import { SupabaseService } from '../supabase/supabase.service';

@Injectable()
export class ChallengesRepository {
  constructor(private readonly supabaseService: SupabaseService) {}

  getById(id: string) {
    return this.supabaseService.findOne('challenges', { id });
  }
}
