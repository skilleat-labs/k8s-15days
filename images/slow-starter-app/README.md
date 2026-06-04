# skilleat/slow-starter-app

Kubernetes **Startup Probe** 동작을 시연하기 위한 Flask 앱.  
서버 자체가 늦게 뜨는 상황(긴 초기화 작업)을 재현한다.

## 환경 변수

| 변수명          | 기본값 | 의미                                       |
|-----------------|--------|--------------------------------------------|
| `STARTUP_DELAY` | `30`   | Flask 서버 기동 전 대기 시간 (초)          |

## 엔드포인트 (서버 기동 후)

| 경로       | 설명 |
|------------|------|
| `GET /`      | 200 — "Hello, finally ready" |
| `GET /healthz` | 200 — `{"status": "healthy"}` |

## 로컬 빌드

```bash
docker build -t skilleat/slow-starter-app:1.0.0 .
```

## 멀티 아키텍처 빌드 + Docker Hub 푸시

```bash
# buildx 빌더 준비 (최초 1회)
docker buildx create --use --name multiarch

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t skilleat/slow-starter-app:1.0.0 \
  --push .
```

## 로컬 테스트

```bash
# 기본값(30초 대기)으로 실행
docker run --rm -p 8080:8080 skilleat/slow-starter-app:1.0.0

# 대기 시간 단축 (빠른 시연용)
docker run --rm -p 8080:8080 \
  -e STARTUP_DELAY=15 \
  skilleat/slow-starter-app:1.0.0
```

## 동작 확인 (curl)

```bash
# 대기 중 접속 시도 → Connection refused
curl http://localhost:8080/healthz

# 서버 기동 후 정상 응답
curl -i http://localhost:8080/
curl -i http://localhost:8080/healthz

# 서버가 뜰 때까지 반복 시도 (1초 간격)
until curl -s http://localhost:8080/healthz; do
  echo "대기 중..."; sleep 1
done
```
