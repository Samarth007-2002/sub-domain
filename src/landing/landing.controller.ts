import { Controller, Get, Param, Render, NotFoundException } from '@nestjs/common';
import { LandingService } from './landing.service';

@Controller('landing-page')
export class LandingController {
  constructor(private readonly landingService: LandingService) {}

  @Get(':pageName')
  @Render('landing')
  async getLandingPage(@Param('pageName') pageName: string) {
    const pageData = await this.landingService.getLandingPageData(pageName);
    if (!pageData) {
      throw new NotFoundException(`Landing page '${pageName}' not found`);
    }
    return pageData;
  }
}
