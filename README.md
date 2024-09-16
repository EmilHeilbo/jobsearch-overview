# Jobsearch Overview

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)


A simple SvelteKit project to keep track of all my job applications, as well as showing a slight bit of full-stack ability.

## Feature list

- Data storage via SQLite

- Basic CRUD operations

- Minimal size

- Server-side rendering

## Deployment

First off, run `bun install` in the project directory.

Remember to configure your SQLite connection string in your local `.env` file.

### If you don't have an existing database file

1. Ensure `./prisma/seed.ts` exists and is configured correctly.

2. `bunx tsc -m nodenext seed.ts`

3. `bunx prisma db seed` – Now you should have a seeded .db file

### Build & Run Container

`docker run -it $(docker build -q .)` – This should build and run the container

Note: You can use `docker run --rm -it $(docker build -q .)` instead during development, to auto-remove the container image after closing

