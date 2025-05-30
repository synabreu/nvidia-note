### 1. 메모리 패브릭 솔루션 ###
  * HPC 및 AI 환경에서 데이터 이동을 최소화하고, GPU 및 CPU의 성능을 극대화하기 위한 필수 기술
  * 서버 간 또는 가속기 간 고속 데이터 공유 및 액세스를 가능하게 하는 기술
  * 대규모 AI 및 고성능 컴퓨팅(HPC) 환경에서 데이터 이동 비용을 줄이고 연산 속도를 극대화
  * 기존의 데이터센터에서는 각 서버 또는 노드가 개별적으로 메모리를 소유하고, 데이터 공유가 필요할 경우 네트워크를 통해 데이터를 복사해야 하나, 메모리 패브릭 기술을 활용하면 각 서버의 메모리를 하나의 거대한 풀(Pool)로 통합하여 공유함
  * CPU나 GPU가 원격에 있는 메모리에 직접 접근할 수 있는 구조를 제공하여 데이터 이동 비용을 줄이고, 지연(Latency)을 최소화

### 2. NVIDIA의 메모리 패브릭 솔루션 ###
  * NVIDIA는 GPUDirect, NVLink, NVSwitch, Infiniband 기반 RDMA 등을 활용하여 AI 및 HPC 환경에서 초고속 데이터 공유

  1) GPUDirect 기술
     * GPUDirect RDMA: CPU를 거치지 않고 GPU가 직접 원격 GPU 또는 스토리지와 데이터를 주고받을 수 있도록 하는 기술
     * GPUDirect Storage: GPU가 NVMe 스토리지와 직접 통신하여 스토리지 입출력 지연을 줄이고 대역폭을 극대화
     * GPUDirect P2P(Peer-to-Peer): 하나의 서버 내에서 여러 GPU 간 직접 데이터 교환 가능

  2) NVLink 및 NVSwitch
     * NVLink: GPU 간 초고속 데이터 전송 인터커넥트 (PCIe보다 최대 10배 빠른 대역폭 제공)
     * NVSwitch: 다수의 NVLink를 연결하여 **GPU 간 전체 연결(All-to-All Connectivity)**을 가능하게 하는 기술
       * 예: NVIDIA DGX 시스템은 NVLink 및 NVSwitch를 통해 여러 개의 GPU가 하나의 거대한 메모리 풀처럼 동작함

  3) Infiniband 및 RDMA 기반 네트워크 패브릭
     * Quantum Infiniband: HPC/AI  환경에서 GPU 간 초저지연, 고대역폭 연결을 제공하는 NVIDIA의 고성능 네트워크 기술
     * RDMA(Remote Direct Memory Access): CPU를 거치지 않고 서버 간 원격 메모리에 직접 접근하여 데이터 전송 속도를 대폭 개선

### 3. 메모리 패브릭이 필요한 이유 ###
  * 데이터 이동 비용 절감: 기존의 CPU 메모리 복사 방식보다 훨씬 적은 오버헤드로 대용량 데이터를 주고받을 수 있음
  * HPC 및 AI 워크로드 가속화: 모델 훈련 및 대규모 데이터 분석 시 GPU 간 빠른 데이터 공유가 필수적
  * 초대형 AI 모델 지원: ChatGPT, Stable Diffusion, BERT 등 거대한 파라미터를 가진 AI 모델을 학습할 때 필요

### 4. NVIDIA의 최신 메모리 패브릭 기술 적용 사례 ###
  * DGX GH200: 576개의 Grace Hopper 슈퍼칩을 NVLink로 연결하여 한 개의 거대한 GPU 메모리 풀처럼 동작
  * Israel-1 AI 슈퍼컴퓨터: Infiniband 기반 네트워크 패브릭을 활용하여 2048개의 H100 GPU를 연결

