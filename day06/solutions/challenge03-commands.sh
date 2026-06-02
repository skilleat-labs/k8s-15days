#!/bin/bash
# 과제 3 정답
# 네임스페이스 간 DNS 통신 확인하기

# 1. team-a 네임스페이스에 curl-test Pod 생성
# kubectl run curl-test --image=curlimages/curl -n team-a -- sleep 3600

# 2. curl-test Pod 생성 확인
# kubectl get pod -n team-a

# 3. curl-test Pod에 접속
# kubectl exec -it curl-test -n team-a -- sh

# 4. 같은 네임스페이스 내 서비스 호출 (team-a 내에서)
# curl http://my-service:8080

# 5. 다른 네임스페이스의 서비스 호출
# 단일 서비스 이름만으로는 찾을 수 없음!
# DNS 형식을 사용해야 함: service-name.namespace.svc.cluster.local

# Team B의 서비스 호출 (v2.0.0 버전)
# curl http://my-service.team-b.svc.cluster.local:8080

# Team C의 서비스 호출 (v3.0.0 버전)  
# curl http://my-service.team-c.svc.cluster.local:8080

# 6. 단축 형식으로도 호출 가능
# curl http://my-service.team-b:8080
# curl http://my-service.team-c:8080

# 7. 각각 다른 버전의 응답이 돌아오는지 확인
# Team A: v1.0.0
# Team B: v2.0.0  
# Team C: v3.0.0

# 8. curl-test Pod 종료
# kubectl delete pod curl-test -n team-a
