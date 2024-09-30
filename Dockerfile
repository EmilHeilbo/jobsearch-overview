FROM oven/bun:slim
WORKDIR /app

COPY ./package.json ./bun.lockb .
RUN bun install --no-cache --frozen-lockfile --verbose

COPY . .
RUN bun prisma db push
RUN bun prisma db seed
RUN bun run build

EXPOSE 3000
ENTRYPOINT [ "bun", "run", "./build/index.js" ]