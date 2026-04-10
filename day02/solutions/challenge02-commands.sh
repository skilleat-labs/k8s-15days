# 과제 2 정답
# --dry-run으로 YAML 뼈대를 만들고 Pod 생성하기

# 1. YAML 뼈대 생성
# kubectl run my-httpd --image=httpd:2.4 --dry-run=client -o yaml > my-httpd-pod.yaml

# 2. 파일을 열어서 다음을 확인/수정
#    - image가 httpd:2.4인지
#    - labels에 app: web-server가 있는지 (없으면 추가)
#    - ports에 containerPort: 80이 있는지 (없으면 추가)

# 3. Pod 생성
# kubectl apply -f my-httpd-pod.yaml

# 4. 이미지 확인
# kubectl describe pod my-httpd | grep Image

# 5. 컨테이너 내부 접속 후 웹 서버 확인
# kubectl exec -it my-httpd -- curl localhost:80
# "It works!" 가 출력되면 정상

# 6. YAML 파일로 삭제
# kubectl delete -f my-httpd-pod.yaml
