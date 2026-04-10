# 과제 1 정답
# --dry-run=client -o yaml로 Deployment YAML 생성하기

# 1. YAML 뼈대 생성
# kubectl create deployment my-app --image=skilleat/pod-info-app:v1.0.1 --replicas=3 --dry-run=client -o yaml > my-app-deployment.yaml

# 2. 파일을 열어서 다음을 확인/수정
#    - labels에 app: my-app이 있는지 (kubectl create deployment는 기본적으로 app 라벨을 추가함)
#    - ports에 containerPort: 8080이 있는지 (없으면 추가)

# 3. Deployment 생성
# kubectl apply -f my-app-deployment.yaml

# 4. Deployment, ReplicaSet, Pod 모두 확인
# kubectl get deployment,replicaset,pod

# 5. Pod가 Running 상태인지 확인
# kubectl get pods
