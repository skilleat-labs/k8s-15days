# 과제 1 정답
# my-web Deployment + NodePort Service 생성

# 1. 리소스 생성
# kubectl apply -f challenge01-my-web-deployment.yaml
# kubectl apply -f challenge01-my-web-nodeport-service.yaml

# 2. 생성 확인
# kubectl get deployment,pod,service

# 3. NodePort 동작 확인
# 브라우저에서 http://localhost:30090 접속
# 또는 터미널에서 curl http://localhost:30090
