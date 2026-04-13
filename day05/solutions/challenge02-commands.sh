# 과제 2 정답
# RollingUpdate로 v2.0.0 배포

# 1. v2 이미지로 업데이트된 YAML 적용
# kubectl apply -f challenge02-rollout-demo-v2-deployment.yaml

# 2. 롤링 업데이트 진행 실시간 확인 (별도 터미널)
# kubectl get pods -l app=rollout-demo -w

# 3. 롤아웃 상태 확인
# kubectl rollout status deployment/rollout-demo

# 4. 브라우저를 새로 고침하면서 파란 배경 → 초록 배경으로 바뀌는 것 확인
# http://localhost:30090
