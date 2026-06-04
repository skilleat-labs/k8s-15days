#!/bin/bash
# 미니 과제 정답: ServiceAccount 만들고 Pod에 연결하기

# ─────────────────────────────────────────
# 과제 1. ServiceAccount 만들기
# ─────────────────────────────────────────

# 1. backup-sa ServiceAccount 생성
# kubectl apply -f challenge-backup-sa.yaml

# 2. 생성 확인
# kubectl get serviceaccount backup-sa

# ─────────────────────────────────────────
# 과제 2. Pod 만들기
# ─────────────────────────────────────────

# 3. backup-pod 생성 (backup-sa 신분으로 동작)
# kubectl apply -f challenge-backup-pod.yaml

# 4. Pod 상태 확인
# kubectl get pod backup-pod

# ─────────────────────────────────────────
# 과제 3. ServiceAccount 연결 확인
# ─────────────────────────────────────────

# 5. describe로 Service Account 항목 확인
# kubectl describe pod backup-pod
# 출력 중 "Service Account: backup-sa" 가 표시되어야 함

# ─────────────────────────────────────────
# 과제 4. 토큰 마운트 확인
# ─────────────────────────────────────────

# 6. Pod 안에서 namespace 파일 확인
# kubectl exec backup-pod -- cat /var/run/secrets/kubernetes.io/serviceaccount/namespace
# 출력: default

# ─────────────────────────────────────────
# 정리
# ─────────────────────────────────────────

# kubectl delete -f challenge-backup-pod.yaml
# kubectl delete -f challenge-backup-sa.yaml
