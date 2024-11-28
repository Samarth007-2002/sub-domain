import { Injectable } from '@nestjs/common';
import * as fs from 'fs/promises';
import * as path from 'path';

@Injectable()
export class LandingService {
  private readonly dataPath = path.join(process.cwd(), 'data', 'landing-pages.json');

  async getLandingPageData(pageName: string) {
    try {
      const data = await fs.readFile(this.dataPath, 'utf8');
      const pages = JSON.parse(data);
      return pages[pageName] || null;
    } catch (error) {
      console.error('Error reading landing page data:', error);
      return null;
    }
  }
}
