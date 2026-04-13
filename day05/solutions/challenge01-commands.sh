# 과제 1 정답
# rollout-demo Deployment + NodePort Service 생성

# 1. 리소스 생성
# kubectl apply -f challenge01-rollout-demo-deployment.yaml
# kubectl apply -f challenge01-rollout-demo-service.yaml

# 2. 생성 확인
# kubectl get deployment,pod,service

# 3. Pod 상태가 Running인지 확인
# kubectl get pods -l app=rollout-demo

# 4. 브라우저에서 파란 배경의 v1.0.0 화면 확인
# http://localhost:30090
