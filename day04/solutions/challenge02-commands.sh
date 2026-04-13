# 과제 2 정답
# Pod 교체 중 연결 유지 확인 + EndpointSlice 변화 확인

# 1. 현재 Pod 목록 확인
# kubectl get pods -l app=my-web

# 2. EndpointSlice 실시간 감시 (별도 터미널)
# kubectl get endpointslices -l kubernetes.io/service-name=my-web-service -w

# 3. 서비스 호출 지속 테스트 (별도 터미널)
# while true; do curl -s http://localhost:30090 | head -n 1; sleep 1; done

# 4. Pod 하나 삭제 (실제 이름으로 교체)
# kubectl delete pod <my-web-pod-name>

# 5. 재생성 및 서비스 연속성 확인
# kubectl get pods -l app=my-web -w
