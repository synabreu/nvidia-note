# PCIe(Peripheral Component Interconnect Express) #

  * PCIe(Peripheral Component Interconnect Express)는 고속 데이터 전송을 위한 컴퓨터 확장 슬롯(인터페이스) 표준
  * 그래픽 카드(GPU), NVMe SSD, 네트워크 카드(NIC), 사운드 카드 등의 고성능 하드웨어를 연결

### 1. PCIe의 주요 특징 ###

  1) 고속 데이터 전송
     * 기존 PCI보다 훨씬 빠른 속도로 데이터를 전송
     * PCIe 4.0(16GB/s), PCIe 5.0(32GB/s), PCIe 6.0(64GB/s) 지원

  2) 확장성(Scalability)
     * x1, x4, x8, x16 슬롯을 지원하여 다양한 장치를 연결 가능
     * GPU는 PCIe x16 슬롯, NVMe SSD는 PCIe x4 슬롯 사용

  3) 전력 효율성 증가
     * 낮은 전력 소비로 데이터 전송 속도 극대화

  4) 하위 호환성(Backward Compatibility)
     * PCIe 5.0 슬롯에 PCIe 4.0, 3.0 장치 사용 가능

  ### 2. PCIe 버전별 속도 비교 ###

  | PCle 버전 | Lande 당 속도(GB/s) | x4 속도 | x8 속도 | x16 속도 |
  |-----------|---------------------|---------|---------|-----------|
  | PCIe 3.0  | 1GB/s               | 4GB/s   | 8GB/s   | 16GB/s    |
  | PCIe 4.0  | 2GB/s               | 8GB/s   | 16GB/s   | 32GB/s    |
  | PCIe 5.0  | 4GB/s               | 16GB/s   | 32GB/s   | 64GB/s    |
  | PCIe 6.0  | 8GB/s               | 32GB/s   | 64GB/s   | 128GB/s    |

  * 최신 AI 및 데이터센터용 GPU(H100, A100 등)는 PCIe 5.0 이상을 사용하여 대역폭을 극대화

 ### 3. PCIe 주요 활용 사례 ###

   *  그래픽 카드(GPU) – AI 및 게이밍에서 고속 연산 및 그래픽 처리
   *  NVMe SSD – 초고속 저장 장치로 PCIe x4 슬롯 사용
   *  네트워크 카드(NIC) – 10Gbps 이상 고속 네트워크 카드 연결
   *  AI 및 데이터센터 – GPU, DPU, FPGA 등 초고속 연산 장치 연결

 ### 4. PCIe와 다른 인터페이스 비교 ###

  | 인터페이스 | 용도  | 속도(최대) | 주요 장점 |
  |-----------|---------------------|---------|---------|
  | PCIe      | GPU, NVMe SSD       | 최대 128GB/s  | 초고속 데이터 전송 | 
  | SATA      | HDD, 일부 SSD       | 600MB/s   | 낮은 비용, 범용성 |
  | USB       | 외장 스토리지, 주변기기 | 40Gbps (USB4)  | 연결 편의성 | 
  | Thunderbolt | 외장 GPU, 고속 데이터 | 40Gbps    | 고속 데이터 전송 | 

 ### 5. PCIe의 미래: PCIe 6.0 & PCIe 7.0 ###

   * PCIe 6.0 : 128GB/s 속도 지원, AI, 머신러닝, 클라우드 데이터센터 최적화
   * PCIe 7.0(2027년 예상) : 256GB/s 속도 제공, 고성능 AI 및 양자컴퓨팅에 필수적

