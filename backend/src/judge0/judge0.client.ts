import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import axios, { AxiosInstance } from 'axios';
import { Judge0Response, Judge0SubmissionPayload } from './interfaces';

@Injectable()
export class Judge0Client {
  private readonly JUDGE0_HOST = 'judge0-ce.p.rapidapi.com';
  private readonly JUDGE0_API_URL = `https://${this.JUDGE0_HOST}`;
  private readonly logger = new Logger(Judge0Client.name);
  private readonly http: AxiosInstance;

  constructor(private readonly configService: ConfigService) {
    const apiKey = this.configService.getOrThrow<string>('RAPIDAPI_KEY');

    this.http = axios.create({
      baseURL: this.JUDGE0_API_URL,
      timeout: 15_000,
      headers: {
        'Content-Type': 'application/json',
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': this.JUDGE0_HOST,
      },
    });
  }

  async createSubmission(
    payload: Judge0SubmissionPayload,
  ): Promise<Judge0Response> {
    const startedAt = Date.now();
    try {
      const { data } = await this.http.post<Judge0Response>(
        '/submissions',
        payload,
        { params: { base64_encoded: false, wait: true } },
      );
      this.logger.log(
        `Judge0 submission language_id=${payload.language_id} statusId=${data.status?.id} time=${data.time}s memory=${data.memory}KB latency=${Date.now() - startedAt}ms`,
      );
      return data;
    } catch (err) {
      const status = (err as any)?.response?.status;
      const code = (err as any)?.code;
      this.logger.error(
        `Judge0 submission failed language_id=${payload.language_id} httpStatus=${status ?? '-'} code=${code ?? '-'} latency=${Date.now() - startedAt}ms msg=${(err as Error).message}`,
      );
      throw err;
    }
  }
}
