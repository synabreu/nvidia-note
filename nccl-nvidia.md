# NVIDIA NCCL(NVIDIA Collective Communications Library) #

### 1. NCCL ###

  * 다중 GPU 환경에서 효율적인 집단 통신(collective communication) 연산을 지원하는 라이브러리
  * 딥러닝과 같은 데이터 병렬 처리 워크로드에서 GPU 간의 데이터를 빠르게 교환하기 위해 사용
  * 다중 GPU 시스템에서 효율적인 데이터 통신
  * 딥러닝 및 병렬 컴퓨팅 응용 프로그램의 성능을 크게 향상시키는 도구

### 2. 주요 기능 ### 

  1) 최적화된 집단 통신: All-reduce, broadcast, reduce, gather, scatter 등 다양한 집단 통신 연산을 효율적으로 수행함.
  2) 다중 GPU 및 클러스터 지원: 단일 시스템 내 여러 GPU는 물론, 분산 시스템이나 클러스터 환경에서도 높은 성능을 유지할 수 있도록 설계되었음.
  3) 하드웨어 가속: NVLink, PCIe 등의 고속 인터커넥트를 활용하여 데이터 전송 속도를 극대화함.
  4) 딥러닝 프레임워크 통합: TensorFlow, PyTorch 등 주요 딥러닝 프레임워크에서 NCCL을 활용하여 모델 학습 시 GPU 간 데이터 동기화 및 통신을 최적화함

### 3. 집단 통신(Collective communication) ###

  * 병렬 컴퓨팅 환경에서 여러 프로세스나 스레드가 서로 데이터를 교환하고 협력하여 작업을 수행할 수 있도록 하는 통신 방식
  * 단일 프로세스 간의 통신이 아니라, 한 그룹 전체가 동시에 참여하는 통신 패턴
  * 고성능 병렬 처리 시스템에서 데이터 동기화, 분산 계산 결과의 통합 및 협력 작업을 효율적으로 수행
  * 딥러닝, 과학 계산, 시뮬레이션 등 대규모 병렬 처리가 필요한 분야에서 필수적
    
  * 주요 특징
    1) 브로드캐스트(Broadcast): 한 프로세스가 데이터를 모든 다른 프로세스에 동시에 전송하는 방식
    2) 게더(Gather) 및 스캐터(Scatter): 여러 프로세스에서 데이터를 한 곳으로 모으거나 한 곳에서 각 프로세스에 데이터를 분배하는 방식
    3) 리듀스(Reduce) 및 올-리듀스(All-Reduce): 각 프로세스의 데이터를 합산, 평균 또는 기타 연산을 통해 하나의 결과로 통합하는 연산
    4) 전체 간(All-to-All): 각 프로세스가 모든 다른 프로세스와 데이터를 교환하는 방식

### 4. 새로운 블로그 ###   

  * [New Scaling Algorithm and Initialization with NVIDIA Collective Communications Library 2.23](https://developer.nvidia.com/blog/new-scaling-algorithm-and-initialization-with-nvidia-collective-communications-library-2-23/)
  * [NVIDIA Announces New Software and Updates to CUDA, Deep Learning SDK and More](https://developer.nvidia.com/blog/nvidia-announces-new-software-and-updates-to-cuda-deep-learning-sdk-and-more/)
  * [NVIDIA Collective Communications Library (NCCL)](https://developer.nvidia.com/nccl)
  * [NVIDIA NCCL Documentation](https://docs.nvidia.com/deeplearning/nccl/index.html)
  * [NVIDIA HPC SDK](https://developer.nvidia.com/hpc-sdk)
    
