# RoCE (RDMA over Converged Ethernet) #

  * 이더넷 네트워크를 통해 원격 직접 메모리 접근(RDMA)을 가능하게 하는 네트워크 프로토콜
  * 데이터가 CPU의 개입 없이 한 컴퓨터의 메모리에서 다른 컴퓨터의 메모리로 직접 전송되므로, 낮은 지연 시간과 높은 처리량을 구현해 네트워크 성능을 극대화
  * RoCE v2는 IP 라우팅을 지원하여 확장성 개선
  * AI, HPC, 스토리지 네트워크, 금융 거래 등 다양한 고성능 환경에서 사용됨
  * AI 및 데이터센터 환경에서는 InfiniBand보다 RoCE를 선호하는 경우가 많음 => 비용 절감 + 기존 Ethernet 인프라 활용 가능
  * InfiniBand의 RDMA 기능을 일반적인 이더넷(Ethernet) 네트워크에서 활용할 수 있도록 확장
  * RoCE를 사용하면 InfiniBand 없이도 RDMA 기술을 활용

### 1. 주요 특징 ###

  * 낮은 지연 시간: CPU 개입을 최소화하여 빠른 데이터 전송
  * 높은 처리량: 네트워크 대역폭을 효율적으로 활용해 대용량 데이터를 빠르게 전송
  * CPU 부하 감소: 데이터 전송 과정에서 CPU의 역할이 줄어들어, 다른 작업에 더 많은 자원을 할당
  * 데이터 센터 및 HPC 환경에 적합: 고성능 컴퓨팅, 대규모 스토리지 네트워크, 클러스터

### 2. RoCE의 버전 차이점 ###

| 버전 | 특징 |
|---------|--------------------------------------------|
| RoCE v1 | - L2 네트워크(Ethernet Layer 2)에서만 작동 |
|         | - 같은 서브넷 내에서만 통신 가능           |
|         | - IP 기반이 아니므로 라우팅 불가능         |
| RoCE v2 | - L3 네트워크(Ethernet Layer 3, IP(UDP) 기반)에서 작동 |
|         | - UDP/IP를 활용하여 RDMA 패킷 전송 (다른 서브넷을 넘어 라우팅 가능) |
|         | - 기존 이더넷 네트워크와의 호환성 증가     |

### 3. RoCE의 장점 ###

  * InfiniBand 없이 RDMA 기능 활용 가능 → 기존 Ethernet 인프라 유지 가능
  * InfiniBand와 비교해 비용 절감 → Ethernet 기반이므로 기존 네트워크 활용 가능
  * TCP/IP 네트워크에서 RDMA를 구현 가능 → 대규모 데이터센터와 AI/ML 환경에서 유용

### 4. RoCE의 활용 사례 ###

  * 주로 고성능 컴퓨팅(HPC), AI 학습, 데이터센터, 클라우드 네트워크, 금융거래 시스템
  * AI & ML 학습 가속
    1) DL 학습에서는 대규모 GPU 간 데이터 교환이 필수적
    2) RoCE를 사용하면 GPU 간 메모리 데이터 교환 속도를 향상
       예) NVIDIA GPUDirect RDMA는 RoCE를 활용하여 GPU와 스토리지 간 빠른 데이터 전송 지원

  * 고성능 데이터센터(HPC) 네트워크
    1) 클러스터 서버 간 초고속 데이터 전송 필요
    2) RoCE는 InfiniBand 없이도 RDMA 기능을 지원하여 데이터센터 구축 비용 절감

  * 스토리지 네트워크(Storage & NVMe over Fabrics)
    1) RoCE는 NVMe-oF(NVMe over Fabrics) 환경에서 활용 가능
    2) 기존 TCP/IP 스토리지보다 레이턴시를 줄이고 성능을 향상

  * 금융거래 시스템(High-Frequency Trading, HFT)
    1) 주식 거래에서 초저지연(Ultra-Low Latency)이 필수적
    2) RoCE 기반 RDMA를 사용하면 데이터 전송 속도를 극대화하여 거래 실행 속도 향상

### 5. RoCE vs. InfiniBand 비교 ###

| 비교 항목 | RoCE | InfiniBand (IB) |
|-----------|-------|-----------------|
| 기반 네트워크 | 기존 Ethernet 사용 | 별도 InfiniBand 네트워크 필요 |
| 비용          | 상대적으로 저렴    | 고가의 전용 장비 필요         |
| 지연시간      | 일반적으로 InfiniBand보다 조금 높음 | 1~2 마이크로초(μs)  |
| 사용되는 스위치 | 일반 Cisco, Arista, Juniper Ethernet 스위치 | Quantum, Omni-Path 등 전용 스위치 |
| 사용되는 어댑터 | 일반 Ethernet NIC 또는 RDMA 지원 NIC | ConnectX-7, ConnectX-6 (HCA) |
| 전송 속도     | 최대 400Gb/s (RoCE 지원) | 최대 400Gb/s (Quantum-2) |
| 확장성        | IP 기반 확장 가능 (RoCE v2) | InfiniBand 전용 장비 필요 |

* InfiniBand는 초저지연, 초고속 네트워크가 필요한 AI 슈퍼컴퓨터 환경에서 필수적!
* RoCE는 기존 Ethernet 인프라를 유지하면서 RDMA 기능을 추가하려는 데이터센터에 적합!

### 6. 결론 ###

 * InfiniBand 네트워크를 구축하려면 전용 스위치와 HCA(어댑터)가 필요함
 * 대표적인 InfiniBand 스위치는 NVIDIA Quantum-2 (400Gb/s), 대표적인 HCA는 ConnectX-7 (400Gb/s)
 * InfiniBand는 AI 슈퍼컴퓨터, HPC 환경에서 필수적이며, RoCE는 일반 데이터센터에서 유용
 * 대규모 AI/ML 학습, 고성능 데이터센터에서는 InfiniBand 네트워크가 최적의 선택
 * 하지만 기존 이더넷 인프라를 유지하면서 RDMA를 활용하려면 RoCE(RDMA over Converged Ethernet)가 더 현실적인 대안

-------------------------------------------------------------------------------------------------------------

### <RDMA(Remote Direct Memory Access)> ###

 * 서버 간 메모리를 직접 접근하여 데이터 전송을 수행하는 기술
 * 기존의 TCP/IP 네트워크에서는 패킷을 전송할 때 CPU가 개입하고 운영 체제(OS) 네트워크 스택을 거쳐야 하기 때문에 오버헤드가 발생
 * 반면, RDMA는 CPU 개입 없이, 직접 네트워크 인터페이스 카드(NIC)에서 메모리 간 데이터를 주고받을 수 있도록 설계
