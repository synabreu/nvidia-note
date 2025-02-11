### 1. 배치 크기 선택 ###
------------------------------------------------------------------------------------

  * 최적의 성능을 달성하려면 먼저 적절한 배치 크기를 식별하는 것이 중요
  * 배치 크기 및 입력/출력 뉴런 개수는 2^N 형태로 설정 권장
  * 보통 8의 배수를 사용하지만, 사용 중인 하드웨어와 모델의 데이터 타입(dtype)에 따라 더 큰 값을 사용할 수도 있음
  * 완전연결 계층(fully connected layers)에서 수행되는 GEMM(General Matrix Multiplications) 연산과 관련하여 NVIDIA가 권장하는 [입력/출력 뉴런 개수](https://docs.nvidia.com/deeplearning/performance/dl-performance-fully-connected/index.html#input-features) 및 [배치 크기를](https://docs.nvidia.com/deeplearning/performance/dl-performance-fully-connected/index.html#batch-size) 확인 필수
  * [Tensor Core 요구사항에서는](https://docs.nvidia.com/deeplearning/performance/dl-performance-matrix-multiplication/index.html#requirements-tc) dtype과 하드웨어에 따라 적절한 배수를 정의
    예) fp16 데이터 타입의 경우 일반적으로 8의 배수를 권장하지만, A100 GPU에서는 64의 배수를 사용하는 것이 더 적합  
  * 파라미터 크기가 작은 경우, [차원 양자화 효과(Dimension Quantization Effects)를](https://docs.nvidia.com/deeplearning/performance/dl-performance-matrix-multiplication/index.html#dim-quantization) 고려.
  * 타일링(tiling)이 발생하는 영역으로, 적절한 배수를 선택하면 성능이 크게 향상
