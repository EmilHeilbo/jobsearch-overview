FROM oven/bun:alpine
WORKDIR /usr/src/app

COPY package*.json .
RUN bun install --force

COPY . .
RUN bunx prisma generate
RUN bun run build

EXPOSE 3000
CMD [ "bun", "run", "./build/index.js" ]