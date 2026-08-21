# syntax=docker/dockerfile:1.7

FROM node:22-bookworm-slim AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
ENV CI="true"

WORKDIR /workspace

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    openssl \
  && rm -rf /var/lib/apt/lists/* \
  && corepack enable \
  && corepack prepare pnpm@9.15.9 --activate \
  && pnpm config set store-dir /pnpm/store

FROM base AS dev

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml turbo.json ./
COPY apps/webapp ./apps/webapp
COPY packages ./packages
COPY tooling ./tooling
COPY patches ./patches

RUN pnpm install --frozen-lockfile --ignore-scripts

EXPOSE 3000

CMD ["sh", "-lc", "pnpm db:generate && pnpm webapp:dev"]
