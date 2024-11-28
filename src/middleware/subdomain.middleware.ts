import { Injectable, NestMiddleware } from '@nestjs/common';
import { Request, Response, NextFunction } from 'express';

@Injectable()
export class SubdomainMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: NextFunction) {
    const hostname = req.hostname;
    const subdomain = hostname.split('.')[0];
    if (subdomain !== 'localhost') {
      req.url = `/landing-page/${subdomain}${req.url}`;
    }
    next();
  }
}
