import os
import socket
from http.server import HTTPServer, BaseHTTPRequestHandler
from datetime import datetime

POD_NAME = os.environ.get("HOSTNAME", "unknown-pod")
POD_IP = os.environ.get("POD_IP", "")
NODE_NAME = os.environ.get("NODE_NAME", "unknown-node")
NAMESPACE = os.environ.get("NAMESPACE", "default")

if not POD_IP:
    try:
        POD_IP = socket.gethostbyname(socket.gethostname())
    except Exception:
        POD_IP = "unknown"

# Color based on pod name hash for visual distinction
def pod_color(name):
    colors = [
        "#4F86C6", "#5BAD6F", "#D96C4B", "#9B59B6",
        "#E67E22", "#1ABC9C", "#E74C3C", "#2980B9",
    ]
    return colors[hash(name) % len(colors)]

HTML_TEMPLATE = """<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pod Info</title>
  <style>
    * {{ box-sizing: border-box; margin: 0; padding: 0; }}
    body {{
      font-family: 'Segoe UI', sans-serif;
      background: #1a1a2e;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }}
    .card {{
      background: #16213e;
      border-radius: 16px;
      padding: 40px 50px;
      width: fit-content;
      min-width: 480px;
      max-width: 90vw;
      border-top: 6px solid {color};
      box-shadow: 0 20px 60px rgba(0,0,0,0.5);
    }}
    .badge {{
      display: inline-block;
      background: {color};
      color: white;
      font-size: 11px;
      font-weight: 700;
      padding: 4px 12px;
      border-radius: 20px;
      letter-spacing: 1px;
      text-transform: uppercase;
      margin-bottom: 24px;
    }}
    h1 {{
      color: white;
      font-size: 22px;
      font-weight: 700;
      margin-bottom: 8px;
      white-space: nowrap;
    }}
    .subtitle {{
      color: #888;
      font-size: 13px;
      margin-bottom: 32px;
    }}
    .info-grid {{
      display: grid;
      gap: 14px;
    }}
    .info-row {{
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: #0f3460;
      border-radius: 10px;
      padding: 14px 18px;
    }}
    .label {{
      color: #aaa;
      font-size: 13px;
      font-weight: 500;
    }}
    .value {{
      color: white;
      font-size: 14px;
      font-weight: 600;
      font-family: 'Courier New', monospace;
    }}
    .ip {{ color: {color}; font-size: 18px; }}
    .hint {{
      margin-top: 28px;
      text-align: center;
      color: #555;
      font-size: 12px;
    }}
    .hint span {{ color: {color}; }}
  </style>
</head>
<body>
  <div class="card">
    <div class="badge">Kubernetes Pod</div>
    <h1>{pod_name}</h1>
    <p class="subtitle">요청을 처리한 파드 정보입니다. 새로고침하면 다른 파드로 바뀔 수 있어요.</p>
    <div class="info-grid">
      <div class="info-row">
        <span class="label">Pod IP</span>
        <span class="value ip">{pod_ip}</span>
      </div>
      <div class="info-row">
        <span class="label">Node</span>
        <span class="value">{node_name}</span>
      </div>
      <div class="info-row">
        <span class="label">Namespace</span>
        <span class="value">{namespace}</span>
      </div>
      <div class="info-row">
        <span class="label">응답 시각</span>
        <span class="value">{timestamp}</span>
      </div>
    </div>
    <p class="hint">새로고침(F5)을 눌러 <span>다른 파드</span>로 라우팅되는지 확인하세요</p>
  </div>
</body>
</html>
"""

class PodInfoHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/healthz":
            self.send_response(200)
            self.send_header("Content-Type", "text/plain")
            self.end_headers()
            self.wfile.write(b"ok")
            return

        body = HTML_TEMPLATE.format(
            color=pod_color(POD_NAME),
            pod_name=POD_NAME,
            pod_ip=POD_IP,
            node_name=NODE_NAME,
            namespace=NAMESPACE,
            timestamp=datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        ).encode("utf-8")

        self.send_response(200)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, format, *args):
        print(f"[{datetime.now().strftime('%H:%M:%S')}] {self.address_string()} - {format % args}")

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    server = HTTPServer(("0.0.0.0", port), PodInfoHandler)
    print(f"Pod Info Server running on port {port}")
    print(f"  Pod Name : {POD_NAME}")
    print(f"  Pod IP   : {POD_IP}")
    print(f"  Node     : {NODE_NAME}")
    print(f"  Namespace: {NAMESPACE}")
    server.serve_forever()
