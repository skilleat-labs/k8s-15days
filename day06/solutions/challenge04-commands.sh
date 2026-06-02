#!/bin/bash
# 과제 4 정답
# 네임스페이스 단위로 정리하기

# 1. team-c 네임스페이스 내 리소스 확인 (삭제 전 반드시 확인!)
# kubectl get all -n team-c

# 2. team-c 네임스페이스 삭제 (네임스페이스 내 모든 리소스가 함께 삭제됨)
# kubectl delete namespace team-c

# 3. team-c 삭제 확인
# kubectl get namespaces

# 4. team-a 리소스 개별 정리
# kubectl delete deployment my-service -n team-a
# kubectl delete service my-service -n team-a

# 5. team-a 정리 확인
# kubectl get all -n team-a

# 6. team-b 리소스 개별 정리
# kubectl delete deployment my-service -n team-b
# kubectl delete service my-service -n team-b

# 7. team-b 정리 확인
# kubectl get all -n team-b

# 8. 네임스페이스는 남겨둘 수도 있고, 함께 삭제할 수도 있음
# 네임스페이스 team-a, team-b도 삭제하려면:
# kubectl delete namespace team-a
# kubectl delete namespace team-b

# 9. 최종 확인
# kubectl get namespaces
