#!/bin/bash
# 과제 2 정답
# 같은 이름, 다른 버전으로 각 네임스페이스에 배포하기

# 1. Team A 배포
# kubectl apply -f challenge02-team-a-deployment.yaml
# kubectl apply -f challenge02-team-a-service.yaml

# 2. Team B 배포
# kubectl apply -f challenge02-team-b-deployment.yaml
# kubectl apply -f challenge02-team-b-service.yaml

# 3. Team C 배포
# kubectl apply -f challenge02-team-c-deployment.yaml
# kubectl apply -f challenge02-team-c-service.yaml

# 4. 배포 확인
# kubectl get deployment -n team-a
# kubectl get deployment -n team-b
# kubectl get deployment -n team-c

# 5. 서비스 확인
# kubectl get svc -A | grep my-service

# 6. Pod 상태 확인
# kubectl get pods -n team-a -o wide
# kubectl get pods -n team-b -o wide
# kubectl get pods -n team-c -o wide

# 7. 브라우저에서 확인 (각 버전이 다른 페이지를 보여줌)
# http://localhost:30091  -> Team A (v1.0.0)
# http://localhost:30092  -> Team B (v2.0.0)
# http://localhost:30093  -> Team C (v3.0.0)

# 8. 또는 curl로 확인
# curl http://localhost:30091
# curl http://localhost:30092
# curl http://localhost:30093
