# 과제 4 정답
# v1.0.0이 있던 revision으로 롤백

# 1. 롤아웃 히스토리 확인
# kubectl rollout history deployment/rollout-demo

# 2. 특정 revision의 상세 내용 확인 (CHANGE-CAUSE 참고)
# kubectl rollout history deployment/rollout-demo --revision=1

# 3. v1.0.0이 있던 revision으로 롤백 (예: revision 1)
# kubectl rollout undo deployment/rollout-demo --to-revision=1

# 4. 롤백 후 Pod 상태 확인
# kubectl get pods -l app=rollout-demo

# 5. 현재 이미지 확인
# kubectl describe deployment rollout-demo | grep Image

# 6. 브라우저에서 다시 파란 배경이 나오는지 확인
# http://localhost:30090

# 7. 실습 완료 후 리소스 정리
# kubectl delete -f challenge01-rollout-demo-service.yaml
# kubectl delete -f challenge01-rollout-demo-deployment.yaml
