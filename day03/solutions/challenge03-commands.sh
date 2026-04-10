# 과제 3 정답
# 롤링 업데이트와 롤백

# --- 이미지 업데이트 (v1.0.1 → v2.0.0) ---

# 1. 이미지 변경 (컨테이너 이름: pod-info-app)
# kubectl set image deployment my-app pod-info-app=skilleat/pod-info-app:v2.0.0

# 2. 롤링 업데이트 진행 상태 확인
# kubectl rollout status deployment my-app

# 3. ReplicaSet이 2개로 늘어났는지 확인
# kubectl get replicasets

# 4. 현재 이미지가 v2.0.0인지 확인
# kubectl describe deployment my-app | grep Image

# --- 롤백 실행 ---

# 5. 이전 버전으로 롤백
# kubectl rollout undo deployment my-app

# 6. 롤백 후 이미지가 v1.0.1로 돌아왔는지 확인
# kubectl describe deployment my-app | grep Image

# 7. ReplicaSet 상태 확인 (이전 RS가 다시 활성화됨)
# kubectl get replicasets

# --- 리소스 정리 ---

# 8. Deployment 삭제 (연결된 ReplicaSet, Pod 모두 함께 삭제됨)
# kubectl delete deployment my-app

# 9. 정리 확인
# kubectl get deployment,replicaset,pod
