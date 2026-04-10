# 과제 1 정답
# kubectl run으로 Pod 만들기

# 1. Pod 생성
# kubectl run my-httpd --image=httpd --labels=app=web-server

# 2. 상태 확인
# kubectl get pods

# 3. 라벨 확인
# kubectl get pods --show-labels

# 4. Pod IP 확인
# kubectl get pods -o wide

# 5. 삭제
# kubectl delete pod my-httpd
