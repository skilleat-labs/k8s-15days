# 15일만에 끝내는 쿠버네티스

> **실습으로 완성하는 컨테이너 오케스트레이션**

이 레포지토리는 도서 「15일만에 끝내는 쿠버네티스」의 실습 파일을 제공합니다.  
책의 각 일차에서 사용하는 YAML 파일과 실습 자료를 일차별로 정리해두었습니다.


## 목차

| 일차 | 주제 | 실습 |
|------|------|------|
| 1일차 | 쿠버네티스는 어떤 구조로 동작하는가 | - |
| 2일차 | Pod는 왜 실행의 최소 단위인가 | [day02](./day02/) |
| 3일차 | ReplicaSet과 Deployment | [day03](./day03/) |
| 4일차 | Service로 Pod 노출하기 | [day04](./day04/) |
| 5일차 | 배포 전략 (Recreate / RollingUpdate) | [day05](./day05/) |
| 6일차 | Namespace로 환경 분리하기 | [day06](./day06/) |
| 7일차 | Ingress와 Gateway API | [day07](./day07/) |
| 8일차 | 준비 중 | 준비 중 |
| 9일차 | 준비 중 | 준비 중 |
| 10일차 | 준비 중 | 준비 중 |
| 11일차 | 준비 중 | 준비 중 |
| 12일차 | 준비 중 | 준비 중 |
| 13일차 | 준비 중 | 준비 중 |
| 14일차 | 준비 중 | 준비 중 |
| 15일차 | 준비 중 | 준비 중 |


## 실습 환경

이 책의 실습은 **Rancher Desktop**을 사용합니다.

| 항목 | 권장 사양 |
|------|-----------|
| OS | Windows 10/11, macOS, Ubuntu 22.04+ |
| Rancher Desktop | 최신 안정 버전 |
| Container Runtime | containerd |
| Kubernetes 버전 | v1.30 이상 |

Rancher Desktop 설치 방법은 도서 2일차에 OS별로 상세히 안내되어 있습니다.


## 디렉토리 구조

```
k8s-15days/
├── README.md
├── images/
│   ├── pod-info-app/        # 실습용 컨테이너 이미지 소스 (v1, v2)
│   └── rollout-demo/        # 배포 전략 실습용 컨테이너 이미지 소스
├── day02/                   # Pod
│   ├── lab017-multi-container-pod.yaml
│   └── solutions/
├── day03/                   # ReplicaSet, Deployment
│   ├── lab022-pod-info-replicaset.yaml
│   └── solutions/
├── day04/                   # Service (ClusterIP, NodePort)
│   ├── lab034-pod-info-deployment.yaml
│   ├── lab035-pod-info-service.yaml
│   ├── lab037-pod-info-nodeport.yaml
│   └── solutions/
├── day05/                   # 배포 전략
│   ├── lab040-recreate-deployment.yaml
│   ├── lab041-rollingupdate-deployment.yaml
│   └── solutions/
├── day06/                   # Namespace
│   ├── lab049-production-namespace.yaml
│   └── solutions/
└── day07/                   # Ingress, Gateway API
    ├── lab051-services.yaml
    ├── lab051-ingress.yaml
    ├── lab052/              # Ingress 실습
    ├── lab053/              # Gateway API 실습
    └── solutions/
```

- 파일명은 `lab{번호}-{설명}.yaml` 형식입니다.
- 실습 번호는 책 전체를 관통하는 일련번호입니다.
- 각 일차 폴더의 `solutions/` 에는 미니 과제 정답 파일이 있습니다.


## 사용 방법

### 1. 레포지토리 클론

```bash
git clone https://github.com/skilleat-labs/k8s-15days.git
cd k8s-15days
```

### 2. 해당 일차 디렉토리로 이동

```bash
cd day02
```

### 3. 실습 파일 적용

```bash
kubectl apply -f lab017-multi-container-pod.yaml
```

### 4. 실습 후 리소스 정리

```bash
kubectl delete -f lab017-multi-container-pod.yaml
```


## 문의 및 오류 제보

- 실습 파일의 오류나 개선 사항은 [Issues](https://github.com/skilleat-labs/k8s-15days/issues)에 등록해주세요.
- 도서 내용에 대한 질문은 **감테크** 커뮤니티를 이용해주세요.


## 관련 링크

- [감테크 YouTube](https://www.youtube.com/@feeltechedu)
- Skilleat Labs: [GitHub](https://github.com/skilleat-labs)


## 라이선스

이 레포지토리의 실습 파일은 [MIT License](./LICENSE)를 따릅니다.  
도서의 본문 내용에 대한 저작권은 저자에게 있습니다.
