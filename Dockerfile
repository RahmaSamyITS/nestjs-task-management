# -----------------------------------
# Base Stage
# -----------------------------------
FROM node:23 AS base
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# -----------------------------------
# Development Stage
# -----------------------------------
FROM base AS development
ENV NODE_ENV=development
CMD ["npm", "run", "start:dev"]

# -----------------------------------
# Testing Stage
# -----------------------------------
FROM base AS testing
ENV NODE_ENV=testing
RUN npm run build
CMD ["npm", "run", "test"]

# -----------------------------------
# Production Stage
# -----------------------------------
FROM base AS build
ENV NODE_ENV=production
RUN npm run build

FROM base AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY package*.json ./
RUN npm install --only=production
CMD ["node", "dist/main"]
