# 과제 3 정답
# 멀티컨테이너 Pod 만들기

# 1. Pod 생성
# kubectl apply -f multi-pod.yaml

# 2. READY 2/2 확인
# kubectl get pods

# 3. helper 컨테이너에서 nginx로 localhost 통신 확인
# kubectl exec -it multi-pod -c helper -- curl localhost:80

# 4. 각 컨테이너 로그 개별 확인
# kubectl logs multi-pod -c web
# kubectl logs multi-pod -c helper

# 5. 리소스 정리
# kubectl delete -f multi-pod.yaml
