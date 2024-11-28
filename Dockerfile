# Stage 1: Build the application

FROM node:20-alpine AS build
 
# Set working directory

WORKDIR /app
 
# Copy package.json and package-lock.json

COPY package*.json ./
 
# Install dependencies

RUN npm install
 
# Copy the rest of the application

COPY . .
 
RUN npm run build

# Stage 2: Run the application

FROM node:20-alpine
 
# Set working directory

WORKDIR /app
 
# Copy the built application from the build stage

COPY --from=build /app .
 
# Expose the port the app runs on

EXPOSE 3000
 
# Run migrations and then start the application

CMD ["npm","run","start"]
 