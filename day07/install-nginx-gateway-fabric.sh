#!/bin/bash
# NGINX Gateway Fabric 설치 (Helm)
# 책 출간 시점 기준 v2.6.2

helm install ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric --create-namespace -n nginx-gateway