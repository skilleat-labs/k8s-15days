FROM python:3.11-slim

WORKDIR /app

# 의존성 먼저 복사 → pip 캐시 레이어 분리
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# 비-루트 사용자 생성 후 전환
RUN adduser --uid 10001 --disabled-password --gecos "" appuser
USER appuser

EXPOSE 8080

CMD ["python", "app.py"]
