FROM node:24-alpine3.24 AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

ARG ATLAS_BASE=/
ENV ATLAS_BASE=${ATLAS_BASE}

RUN npm run build

FROM ghcr.io/nginx/nginx-unprivileged:1.31.8-alpine3.24

COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build --chown=nginx:nginx /app/dist /usr/share/nginx/html

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:8080/ || exit 1
