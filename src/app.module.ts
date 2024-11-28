import { Module, NestModule, MiddlewareConsumer } from '@nestjs/common';
import { LandingModule } from './landing/landing.module';
import { SubdomainMiddleware } from './middleware/subdomain.middleware';

@Module({
  imports: [LandingModule],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(SubdomainMiddleware).forRoutes('*');
  }
}
