FROM oven/bun:slim
WORKDIR /app

COPY ./package.json ./bun.lockb .
RUN bun install --no-cache --frozen-lockfile --verbose

COPY . .
RUN bunx prisma generate
RUN bun run build

EXPOSE 3000
ENTRYPOINT [ "bun", "run", "./build/index.js" ]