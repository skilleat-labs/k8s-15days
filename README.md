# 📘 15일만에 끝내는 쿠버네티스

> **실습으로 완성하는 컨테이너 오케스트레이션**

이 레포지토리는 도서 **「15일만에 끝내는 쿠버네티스」**의 실습 파일을 제공합니다.  
책의 각 일차에서 사용하는 YAML 파일과 실습 자료를 일차별로 정리해두었습니다.


## 📋 목차

| 일차 | 주제 | 실습 |
|------|------|------|
| 1일차 | 쿠버네티스는 어떤 구조로 동작하는가 | - |
| 2일차 | Pod는 왜 실행의 최소 단위인가 | [day02](./day02/) |
| 3일차 | 준비 중 | 준비 중 |
| 4일차 | 준비 중 | 준비 중 |
| 5일차 | 준비 중 | 준비 중 |
| 6일차 | 준비 중 | 준비 중 |
| 7일차 | 준비 중 | 준비 중 |
| 8일차 | 준비 중 | 준비 중 |
| 9일차 | 준비 중 | 준비 중 |
| 10일차 | 준비 중 | 준비 중 |
| 11일차 | 준비 중 | 준비 중 |
| 12일차 | 준비 중 | 준비 중 |
| 13일차 | 준비 중 | 준비 중 |
| 14일차 | 준비 중 | 준비 중 |
| 15일차 | 준비 중 | 준비 중 |


## 🛠 실습 환경

이 책의 실습은 **Rancher Desktop**을 사용합니다.

| 항목 | 권장 사양 |
|------|-----------|
| OS | Windows 10/11, macOS, Ubuntu 22.04+ |
| Rancher Desktop | 최신 안정 버전 |
| Container Runtime | containerd |
| Kubernetes 버전 | v1.30 이상 |

Rancher Desktop 설치 방법은 도서 2일차에 OS별로 상세히 안내되어 있습니다.


## 📂 디렉토리 구조

```
k8s-15days/
├── README.md
├── day02/
│   ├── lab001-run-first-pod.yaml
│   ├── lab013-nginx-pod.yaml
│   ├── lab016-multi-container-pod.yaml
│   └── ...
├── day03/
│   └── ...
├── day04/
│   └── ...
└── ...
```

- 파일명은 `lab{번호}-{설명}.yaml` 형식입니다.
- 실습 번호는 책 전체를 관통하는 일련번호입니다.


## 🚀 사용 방법

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
kubectl apply -f lab013-nginx-pod.yaml
```

### 4. 실습 후 리소스 정리

```bash
kubectl delete -f lab013-nginx-pod.yaml
```


## ❓ 문의 및 오류 제보

- 실습 파일의 오류나 개선 사항은 [Issues](https://github.com/skilleat-labs/k8s-15days/issues)에 등록해주세요.
- 도서 내용에 대한 질문은 **감테크** 커뮤니티를 이용해주세요.


## 📌 관련 링크

- 🎬 [감테크 YouTube](https://www.youtube.com/@feeltechedu)
- 📚 Skilleat Labs: [GitHub](https://github.com/skilleat-labs)


## 📄 라이선스

이 레포지토리의 실습 파일은 [MIT License](./LICENSE)를 따릅니다.  
도서의 본문 내용에 대한 저작권은 저자에게 있습니다.
