import os
import time
from flask import Flask, jsonify

app = Flask(__name__)

# 프로세스 시작 시각 (단조 시계)
START_TIME = time.monotonic()

# 환경 변수는 시작 시점에 한 번만 읽기
HEALTHY_DURATION = int(os.environ.get("HEALTHY_DURATION", 30))
READY_AFTER = int(os.environ.get("READY_AFTER", 10))


def elapsed() -> float:
    return time.monotonic() - START_TIME


def log(path: str, status: int):
    print(f"{path} {status}", flush=True)


@app.route("/")
def index():
    log("/", 200)
    return "Hello from health-demo-app", 200


@app.route("/healthz")
def healthz():
    if elapsed() < HEALTHY_DURATION:
        log("/healthz", 200)
        return jsonify({"status": "healthy"}), 200
    log("/healthz", 500)
    return jsonify({"status": "unhealthy: memory leak simulation"}), 500


@app.route("/ready")
def ready():
    if elapsed() < READY_AFTER:
        log("/ready", 503)
        return jsonify({"status": "not ready yet"}), 503
    log("/ready", 200)
    return jsonify({"status": "ready"}), 200


if __name__ == "__main__":
    print(f"HEALTHY_DURATION={HEALTHY_DURATION}s  READY_AFTER={READY_AFTER}s", flush=True)
    app.run(host="0.0.0.0", port=8080)
