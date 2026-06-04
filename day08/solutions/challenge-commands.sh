#!/bin/bash
# 미니 과제 정답: ConfigMap과 Secret 함께 적용해보기

# ─────────────────────────────────────────
# 과제 1. ConfigMap 만들기
# ─────────────────────────────────────────

# 1. ConfigMap 생성
# kubectl apply -f challenge-configmap.yaml

# 2. ConfigMap 확인
# kubectl get configmap shop-prod-config
# kubectl describe configmap shop-prod-config

# ─────────────────────────────────────────
# 과제 2. Secret 만들기
# ─────────────────────────────────────────

# 3. base64 인코딩 값 확인 (참고용)
# echo -n 'my-prod-pw' | base64
# 결과: bXktcHJvZC1wdw==

# 4. Secret 생성
# kubectl apply -f challenge-secret.yaml

# 5. Secret 확인 (값은 base64로 가려져 있음)
# kubectl get secret shop-prod-secret
# kubectl describe secret shop-prod-secret

# ─────────────────────────────────────────
# 과제 3. Pod 만들기
# ─────────────────────────────────────────

# 6. Pod 생성
# kubectl apply -f challenge-pod.yaml

# 7. Pod 상태 확인 (Running 될 때까지 대기)
# kubectl get pod shop-prod-pod

# ─────────────────────────────────────────
# 과제 4. 동작 확인
# ─────────────────────────────────────────

# 8. 환경 변수 주입 확인 (네 개 모두 출력되는지 확인)
# kubectl logs shop-prod-pod | grep -E "DB_HOST|DB_PORT|LOG_LEVEL|DB_PASSWORD"

# 예상 출력:
# DB_HOST=prod-db.example.com
# DB_PORT=5432
# LOG_LEVEL=warn
# DB_PASSWORD=my-prod-pw

# ─────────────────────────────────────────
# 정리
# ─────────────────────────────────────────

# kubectl delete -f challenge-pod.yaml
# kubectl delete -f challenge-secret.yaml
# kubectl delete -f challenge-configmap.yaml
