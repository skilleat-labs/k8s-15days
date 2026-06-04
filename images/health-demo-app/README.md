# skilleat/health-demo-app

Kubernetes **Liveness Probe** / **Readiness Probe** 동작을 시연하기 위한 Flask 앱.

## 환경 변수

| 변수명             | 기본값 | 의미                                               |
|--------------------|--------|----------------------------------------------------|
| `HEALTHY_DURATION` | `30`   | 시작 후 이 초(s)가 지나면 `/healthz`가 500을 반환  |
| `READY_AFTER`      | `10`   | 시작 후 이 초(s)가 지나야 `/ready`가 200을 반환    |

## 엔드포인트

| 경로       | 설명 |
|------------|------|
| `GET /`      | 항상 200 — "Hello from health-demo-app" |
| `GET /healthz` | `HEALTHY_DURATION` 초 이내 200, 이후 500 |
| `GET /ready`   | `READY_AFTER` 초 이내 503, 이후 200 |

## 로컬 빌드

```bash
docker build -t skilleat/health-demo-app:1.0.0 .
```

## 멀티 아키텍처 빌드 + Docker Hub 푸시

```bash
# buildx 빌더 준비 (최초 1회)
docker buildx create --use --name multiarch

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t skilleat/health-demo-app:1.0.0 \
  --push .
```

## 로컬 테스트

```bash
# 기본값으로 실행
docker run --rm -p 8080:8080 skilleat/health-demo-app:1.0.0

# 환경 변수 조정 (빠른 시연용)
docker run --rm -p 8080:8080 \
  -e HEALTHY_DURATION=20 \
  -e READY_AFTER=5 \
  skilleat/health-demo-app:1.0.0
```

## 동작 확인 (curl)

```bash
# 기본 응답
curl http://localhost:8080/

# Readiness (시작 직후 → 503)
curl -i http://localhost:8080/ready

# Liveness (HEALTHY_DURATION 초 이전 → 200)
curl -i http://localhost:8080/healthz

# 반복 확인 (2초 간격)
watch -n 2 'curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/healthz'
```
