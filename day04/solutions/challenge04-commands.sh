#!/bin/bash
# 과제 4 정답
# DNS 이름으로 접근해보기
# curl-test Pod에서 my-web-service에 Service 이름만으로 접근
# IP로 접근했을 때와 동일한 응답이 돌아오는지 확인
# 전체 DNS 이름 형식으로도 접근해보기

# 1. 먼저 과제 1의 리소스가 실행 중인지 확인
# kubectl get deployment,pod,service

# 2. curl-test Pod 실행 (임시 테스트용)
# kubectl run curl-test --image=curlimages/curl:latest --rm -it -- sh

# 3. curl-test Pod 내에서 실행할 명령어들:

# 3-1. Service명만으로 접근 (가장 짧은 DNS 이름)
# curl my-web-service:8080

# 3-2. 네임스페이스 포함 DNS 이름으로 접근
# curl my-web-service.default:8080

# 3-3. 전체 DNS 이름 (FQDN) 으로 접근
# curl my-web-service.default.svc:8080

# 3-4. 전체 DNS 이름 (FQDN) 으로 접근 (cluster.local 포함)
# curl my-web-service.default.svc.cluster.local:8080

# 4. Service의 Cluster IP 확인을 위해 호스트에서 실행
# kubectl get svc my-web-service -o wide

# 5. Service의 Cluster IP로 직접 접근 (별도의 청크기반 Pod에서)
# kubectl run curl-test2 --image=curlimages/curl:latest --rm -it -- sh
# 위 pod 내에서: curl <CLUSTER_IP>:8080

# 6. 모든 방식에서 동일한 웹 페이지가 응답되는지 확인
# - Service 이름으로 접근한 경우
# - FQDN으로 접근한 경우
# - Cluster IP로 접근한 경우
# 모두 동일한 응답이 돌아와야 함

# 7. 테스트 정리
# curl-test Pod 종료 시 --rm 옵션으로 자동 삭제됨
