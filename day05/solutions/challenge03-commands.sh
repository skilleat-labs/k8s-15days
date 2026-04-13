# 과제 3 정답
# Recreate 전략으로 v3.0.0 배포

# 1. 사전 준비: Pod 상태 실시간 감시 시작 (별도 터미널)
# kubectl get pods -l app=rollout-demo -w

# 2. v3 이미지 + Recreate 전략으로 적용
# kubectl apply -f challenge03-rollout-demo-v3-deployment.yaml

# 3. 배포 중 브라우저에서 접속하면 일시적으로 503 Service Unavailable 발생
# - Recreate는 기존 Pod를 모두 삭제한 뒤 새 Pod를 생성하므로 다운타임이 발생함
# http://localhost:30090

# 4. 롤아웃 완료 확인
# kubectl rollout status deployment/rollout-demo

# 5. 롤아웃 히스토리 확인 (rollback 전 미리 확인)
# kubectl rollout history deployment/rollout-demo
