#!/bin/bash
# Gateway API 표준 CRD 설치
# 책 출간 시점 기준 NGINX Gateway Fabric v2.6.2 호환
# 최신 버전: https://github.com/nginx/nginx-gateway-fabric/releases

kubectl kustomize "https://github.com/nginx/nginx-gateway-fabric/config/crd/gateway-api/standard?ref=v2.6.2" | kubectl apply -f -