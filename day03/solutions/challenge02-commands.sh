# 과제 2 정답
# 장애 복구와 스케일링

# --- Pod 2개 삭제 후 자동 복구 확인 ---

# 1. 현재 Pod 이름 목록 확인
# kubectl get pods

# 2. Pod 2개 삭제 (실제 Pod 이름으로 교체)
# kubectl delete pod <pod-name-1> <pod-name-2>

# 3. Pod가 자동으로 3개로 복구되는지 확인 (-w로 실시간 감시)
# kubectl get pods -w

# --- replicas를 5로 늘리기 ---

# 4. replicas를 5로 변경
# kubectl scale deployment my-app --replicas=5

# 5. Pod가 5개로 늘어났는지 확인
# kubectl get pods

# --- replicas를 2로 줄이기 ---

# 6. replicas를 2로 변경
# kubectl scale deployment my-app --replicas=2

# 7. Pod가 2개로 줄어들었는지 확인
# kubectl get pods
