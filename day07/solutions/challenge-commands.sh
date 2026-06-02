#!/bin/bash
# 미니 과제 정답: Gateway API로 새 서비스 추가하기

# ─────────────────────────────────────────
# 과제 1. 결제 서비스 만들기
# ─────────────────────────────────────────

# 1. pay Deployment와 Service 생성
# kubectl apply -f pay-service.yaml

# 2. Pod 상태 확인 (Running 상태인지 확인)
# kubectl get pods -l app=pay

# 3. Service 확인
# kubectl get svc pay

# ─────────────────────────────────────────
# 과제 2. HTTPRoute 추가하기
# ─────────────────────────────────────────

# 4. pay-route HTTPRoute 생성
# kubectl apply -f pay-route.yaml

# 5. HTTPRoute 등록 확인
# kubectl get httproute pay-route

# ─────────────────────────────────────────
# 과제 3. 동작 확인
# ─────────────────────────────────────────

# 6. 노드 IP와 NGINX Gateway의 NodePort 확인
# kubectl get nodes -o wide
# kubectl get svc -n nginx-gateway

# 7. Traefik Ingress로 노출된 서비스 확인 (NodePort 확인)
# kubectl get svc -n kube-system | grep traefik

# 8. curl로 전체 동작 확인
# (아래 <NODE_IP>, <TRAEFIK_PORT>, <NGINX_PORT>를 실제 값으로 교체)

# shop.local  → Hello from shop  (Traefik / Ingress)
# curl -H "Host: shop.local" http://<NODE_IP>:<TRAEFIK_PORT>

# admin.local → Hello from admin (Traefik / Ingress)
# curl -H "Host: admin.local" http://<NODE_IP>:<TRAEFIK_PORT>

# shop.gw.local  → Hello from shop  (NGINX Gateway Fabric / Gateway API)
# curl -H "Host: shop.gw.local" http://<NODE_IP>:<NGINX_PORT>

# admin.gw.local → Hello from admin (NGINX Gateway Fabric / Gateway API)
# curl -H "Host: admin.gw.local" http://<NODE_IP>:<NGINX_PORT>

# pay.gw.local   → Hello from pay   (NGINX Gateway Fabric / Gateway API)
# curl -H "Host: pay.gw.local" http://<NODE_IP>:<NGINX_PORT>
