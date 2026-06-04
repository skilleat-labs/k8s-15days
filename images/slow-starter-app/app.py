import os
import time
from flask import Flask, jsonify

app = Flask(__name__)

# 환경 변수는 시작 시점에 한 번만 읽기
STARTUP_DELAY = int(os.environ.get("STARTUP_DELAY", 30))


def wait_for_startup():
    """STARTUP_DELAY 초 동안 서버를 띄우지 않고 대기."""
    remaining = STARTUP_DELAY
    while remaining > 0:
        print(f"Waiting {remaining}s before starting server...", flush=True)
        sleep_sec = min(5, remaining)
        time.sleep(sleep_sec)
        remaining -= sleep_sec


@app.route("/")
def index():
    print("/ 200", flush=True)
    return "Hello, finally ready", 200


@app.route("/healthz")
def healthz():
    print("/healthz 200", flush=True)
    return jsonify({"status": "healthy"}), 200


if __name__ == "__main__":
    print(f"STARTUP_DELAY={STARTUP_DELAY}s", flush=True)
    wait_for_startup()
    print("Server started after delay", flush=True)
    app.run(host="0.0.0.0", port=8080)
