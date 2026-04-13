# 과제 3 정답
# ClusterIP Service 생성 및 Endpoint 연결 확인 + 정리

# 1. ClusterIP Service 생성
# kubectl apply -f challenge03-my-web-clusterip-service.yaml

# 2. Endpoint 연결 확인
# kubectl describe service my-web-clusterip-service

# 3. 리소스 정리
# kubectl delete -f challenge03-my-web-clusterip-service.yaml
# kubectl delete -f challenge01-my-web-nodeport-service.yaml
# kubectl delete -f challenge01-my-web-deployment.yaml

# 4. 정리 확인
# kubectl get deployment,pod,service
