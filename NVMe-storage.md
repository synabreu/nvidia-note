# NVMe 스토리지 #

##### 정의 : NVMe(Non-Volatile Memory Express) 스토리지는 고속 SSD(Solid State Drive) 인터페이스 및 프로토콜로,
기존 SATA(SATA SSD) 및 SAS(SAS SSD) 대비 **훨씬 빠른 데이터 전송 속도와 낮은 지연시간(Latency)**을 제공함 #####

### 1. NVMe의 주요 특징 ###

  1) 초고속 데이터 전송 속도
     * 기존 SATA SSD(600MB/s) 대비 최대 10배 이상 빠른 속도(최대 7GB/s 이상) 제공
     * 병렬 데이터 전송을 활용해 수천 개의 큐(Queue) 및 수십만 개의 명령어(Command) 처리 가능

  2) 낮은 지연속도(Latency) → 즉각적인 응답 속도
     * 기존 **SATA는 1개 큐(32개 명령어)**만 처리 가능했지만, NVMe는 최대 64K(64,000개) 큐, 각 큐당 64K 명령어 처리 가능
     * 데이터 요청 시간이 줄어들어 AI, HPC, DB 등의 실시간 응답성 증가

  3) PCIe 인터페이스 사용
     * 기존 SSD(SATA, SAS)보다 더 넓은 대역폭 제공
     * 최신 NVMe SSD는 PCIe 4.0, 5.0 지원(최대 16GB/s 이상 대역폭)

  4) 고성능 AI, HPC, 데이터센터에 최적화
     * AI 학습 데이터 로딩, 데이터 분석, 금융 트랜잭션, 클라우드 서비스 등에 최적화됨
     * **NVIDIA GPUDirect Storage(GDS)**와 함께 사용하면 GPU가 직접 NVMe SSD에서 데이터를 로드 가능

### 2. 기존 SSD(SATA, SAS)와의 차이점 ###

| 특징       | SATA SSD | SAS SSD | NVMe SSD |
| 인터페이스 | SATA     | SAS     | PCIe     |
| 최대 속도  | 600 MB/s | 1.2 GB/s | 7GB/s ~ 16GB/s |
| 지연 시간  | 100 ~ 200 ms | 50 ~ 100 ms | 10 ~ 20 ms |
| 큐 깊이   | 32개 명령어 | 256개 명령어 | 64큐 x 64K 명령어 |
| 적용 분야 | 일반 PC, 저성능 서버 | 엔터프라이즈 서버 | AI, HPC, 데이터 센터 |

* NVMe는 AI 훈련, 데이터 분석, HPC, 클라우드 환경에 필수적인 고속 스토리지 기술
* PCIe(Peripheral Component Interconnect Express)는 고속 데이터 전송을 위한 컴퓨터 확장 슬롯(인터페이스) 표준으로, 주로 GPU(그래픽 카드), NVMe SSD, 네트워크 카드(NIC), 사운드 카드 등의 고성능 하드웨어를 연결하는 데 사용됨

### 3. NVMe의 주요 활용 사례 ###

  1) AI 및 머신러닝 데이터 로딩
     * 대규모 데이터셋을 빠르게 로딩하여 AI 모델 학습 속도 향상
     * NVIDIA GPUDirect Storage를 통해 CPU를 거치지 않고 GPU가 직접 NVMe에서 데이터 로드 가능
  2) 고성능 데이터 분석 및 빅데이터 처리
     * SQL 데이터베이스, 실시간 로그 분석, NoSQL 시스템(MongoDB, Cassandra) 등에 사용
     * 수십 테라바이트(TB)의 데이터도 초고속으로 처리 가능
  3) 고성능 컴퓨팅(HPC) 및 슈퍼컴퓨터
     * 유전체 분석, 금융 시뮬레이션, 물리학/화학 계산 등에 필수적인 저지연, 초고속 스토리지
  4) 클라우드 및 데이터센터
     * AWS, Google Cloud, Microsoft Azure 등 클라우드 서비스에서 표준 스토리지로 사용
     * NVMe-oF(NVMe over Fabrics)를 활용하여 대규모 클러스터에서 네트워크 기반 NVMe 공유 가능
