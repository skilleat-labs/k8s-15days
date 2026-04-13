# syntax=docker/dockerfile:1

# ── build stage: 빌드 머신 플랫폼에서 pip 설치 (크로스 빌드 속도 향상) ──
FROM --platform=$BUILDPLATFORM python:3.11-slim AS builder
WORKDIR /deps
RUN pip install --no-cache-dir --target=/deps flask

# ── final stage: 타깃 플랫폼(linux/amd64, linux/arm64) ──
FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /deps /usr/local/lib/python3.11/site-packages
COPY . .
ARG APP_VERSION=v1.0.0
ENV APP_VERSION=${APP_VERSION}
EXPOSE 8080
CMD ["python", "app.py"]
