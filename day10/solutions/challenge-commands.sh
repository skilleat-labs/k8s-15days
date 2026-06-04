#!/bin/bash
# 미니 과제 정답: 백업 Pod에 권한 부여하기

# ─────────────────────────────────────────
# 과제 1. ServiceAccount 만들기
# ─────────────────────────────────────────

# 1. backup-sa ServiceAccount 생성 (없다면)
# kubectl apply -f challenge-backup-sa.yaml

# 2. 생성 확인
# kubectl get serviceaccount backup-sa

# ─────────────────────────────────────────
# 과제 2. Role 만들기
# ─────────────────────────────────────────

# 3. config-reader Role 및 RoleBinding 생성
# kubectl apply -f challenge-rbac.yaml

# 4. Role 확인
# kubectl get role config-reader
# kubectl describe role config-reader

# 5. RoleBinding 확인
# kubectl get rolebinding backup-can-read-configs
# kubectl describe rolebinding backup-can-read-configs

# ─────────────────────────────────────────
# 과제 3. Pod 만들기
# ─────────────────────────────────────────

# 6. backup-pod 생성
# kubectl apply -f challenge-backup-pod.yaml

# 7. Pod 상태 확인
# kubectl get pod backup-pod

# ─────────────────────────────────────────
# 과제 4. API 호출로 권한 확인
# ─────────────────────────────────────────

# 8. Pod 안으로 접속
# kubectl exec -it backup-pod -- sh

# 9. Pod 안에서 토큰을 변수에 저장
# TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)

# 10. ConfigMap 목록 조회 API 호출 (200 OK 응답 확인)
# wget -qO- --no-check-certificate \
#   --header="Authorization: Bearer $TOKEN" \
#   https://kubernetes.default.svc/api/v1/namespaces/default/configmaps

# ─────────────────────────────────────────
# 과제 5. kubectl auth can-i 로 권한 검증
# ─────────────────────────────────────────

# 11. ConfigMap list 권한 확인 (yes 응답이어야 함)
# kubectl auth can-i list configmaps --as=system:serviceaccount:default:backup-sa

# 12. Secret list 권한 확인 (yes 응답이어야 함)
# kubectl auth can-i list secrets --as=system:serviceaccount:default:backup-sa

# 참고: 부여하지 않은 권한은 no로 응답
# kubectl auth can-i delete configmaps --as=system:serviceaccount:default:backup-sa

# ─────────────────────────────────────────
# 정리
# ─────────────────────────────────────────

# kubectl delete -f challenge-backup-pod.yaml
# kubectl delete -f challenge-rbac.yaml
# kubectl delete -f challenge-backup-sa.yaml
