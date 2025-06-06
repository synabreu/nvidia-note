# 단일 GPU에서 효율적인 학습을 위한 방법 및 도구 #

이 문서는 모델 메모리 활용을 최적화하고 학습 속도를 높이거나 둘 다 향상시켜 모델 학습의 효율성을 높이는 실용적인 방법을 설명한다. 학습 과정에서 GPU가 어떻게 활용되는지 이해하고 싶다면, 먼저 [모델 학습 구조 개념 문서를](https://huggingface.co/docs/transformers/v4.48.2/en/model_memory_anatomy) 참고하라.

대규모 모델을 학습할 때는 다음 두 가지 측면을 동시에 고려해야 한다.

- 데이터 처리량/학습 시간  
- 모델 성능  

처리량(초당 샘플 수, Throughput)을 최대화하면 학습 비용을 절감할 수 있다. 일반적으로 이는 GPU를 최대한 활용하고 GPU 메모리를 한계까지 채우는 방식으로 이루어졌다. 만약 원하는 배치 크기가 GPU 메모리 한계를 초과하는 경우, 누적 그래디언트 업데이트(Gradient Accumulation Update)과 같은 메모리 최적화 기법을 도움이 될 수 있다. 

그러나 원하는 배치 크기가 메모리에 적합하게 들어간다면, 메모리 최적화 기법을 적용할 필요가 없다. 이러한 기법은 학습 속도를 저하시킬 수도 있기 때문에 단순히 큰 배치 크기를 사용할 수 있다고 해서 반드시 사용해야 하는 것은 아니다. 

하이퍼파라미터 튜닝의 일환으로, 어떤 배치 크기가 최상의 결과를 제공하는지 확인한 후, 이에 맞춰 자원을 최적화하는 것이 중요하다. 이 문서에서 다루는 방법과 도구는 학습 과정에 미치는 영향을 기준으로 아래와 같이 분류할 수 있다.

| 메서드/도구 | 훈련 속도 향상 | 메모리 활용 최적화 |
|----------------|----------------|---------------------|
| [배치 크기 선택](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/Batch_size_choice.md) | 예             | 예              |
| [그래디언트 누적](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/gradient-accumulation.md) | 아니오         | 예                  |
| [그래디언트 체크포인트](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/gradient-checkpointing.md)  | 아니오   | 예   |
| [혼합 정밀도 훈련](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/mixed-precision-training.md)  | 예   | 아마도*   |
| [torch_empty_cache_steps](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/torch_empty_cache_steps.md)  | 아니오   | 예   |
| [Optimizer 선택](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/optimizer-choice.md)  | 예  | 예   |
| [데이터 프리로딩](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/data-preloading.md)  | 예   | 아니오   |
| [DeepSpeed Zero](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/deepspeed-zero.md)  | 아니오   | 예   |
| [torch.compile](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/using-torchcompile.md)  | 예   | 아니오   |
| [파라미터-효율적 미세조정(PEFT, Parameter-Efficient Fine Tuning](https://github.com/synabreu/nvidia-note/edit/main/Huggingface-PS/using--peft.md)  | 아니오   | 예   |

*참고: 작은 모델과 큰 배치 크기를 사용할 때 혼합 정밀도를 적용하면 일부 메모리를 절약할 수 있지만, 큰 모델과 작은 배치 크기를 사용할 경우 메모리 사용량이 증가할 수 있음*

위의 방법들을 결합하여 누적 효과를 얻을 수 있다. 이러한 기법들은 모델을 [Trainer로](https://huggingface.co/docs/transformers/v4.48.2/en/main_classes/trainer#transformers.Trainer) 학습하든 순수한 PyTorch 루프를 사용하든 모두 활용할 수 있으며, 후자의 경우 [Accelerate를 사용하여 최적화를 구성할 수 있다.](https://huggingface.co/docs/transformers/v4.48.2/en/perf_train_gpu_one#using--accelerate)  

만약 이러한 방법들로도 충분한 성능 향상이 이루어지지 않는다면, 아래와 같이 옵션들을 고려해 볼 수 있다:  

- [효율적인 소프트웨어 프리빌드가 포함된 자체 맞춤형 Docker 컨테이너를 구축](https://huggingface.co/docs/transformers/v4.48.2/en/perf_train_gpu_one#efficient-software-prebuilds)  
- [MoE(Mixture of Experts) 모델을 사용하는 방안 고려](https://huggingface.co/docs/transformers/v4.48.2/en/perf_train_gpu_one#mixture-of-experts)  
- [PyTorch 네이티브 어텐션을 활용하기 위해 모델을 BetterTransformer로 변환](https://huggingface.co/docs/transformers/v4.48.2/en/perf_train_gpu_one#using-pytorch-native-attention-and-flash-attention)  

끝으로, A100과 같은 서버급 GPU로 전환한 이후에도 여전히 성능이 부족하다면 다중 GPU 환경으로 이동하는 것을 고려해야 한다. 위의 모든 방법들은 다중 GPU 환경에서도 유효하며, 추가적인 병렬화 기법을 활용할 수 있다. 다중 GPU 설정에 대한 자세한 내용은 해당 부분에서 확인한다. 

### 용어 ###

1. [누적 그래디언트 업데이트(Gradient Accumulation Update)]() => 메모리 제한을 극복하기 위한 기법

   * 정의: GPU 메모리가 제한된 상황에서 큰 배치 크기를 효과적으로 처리하기 위한 기법, 메모리 제한 
   * 문제점 : 일반적으로 미니배치 크기를 늘리면 학습 안정성이 증가하지만, GPU 메모리 한계로 인해 대형 배치를 직접 사용할 수 없는 경우가 많다. 
   * 솔루션 : 여러 개의 작은 미니배치에서 계산한 그래디언트를 누적한 후, 일정 횟수마다 가중치를 업데이트하는 방식 적용
  
2. [타일링(tiling)]

 ✅ 정의
 
   * 메모리 및 계산 효율성을 높이기 위해 큰 행렬이나 데이터 블록을 작은 조각(타일, tile)으로 나누어 처리하는 최적화 기법
   * 큰 행렬 연산을 작은 블록 단위로 나누어 캐시 및 병렬 처리를 최적화
   * CPU/GPU 연산에서 *메모리 로컬리티(locality)*를 개선하여 성능 향상
   * GEMM(General Matrix Multiplication), CNN, Transformer와 같은 연산에서 활용

 ✅ 타일링이 중요한 이유
 
   1) 메모리 계층 구조 활용
      * 대부분의 하드웨어(CPU/GPU)는 캐시 메모리를 사용하여 성능을 높임
      * 큰 데이터셋을 처리할 때 한 번에 모든 데이터를 메모리에 올리기 어려우므로, 작은 단위(타일)로 나눠서 캐시에 올리는 방식이 더 효율적
           
      2) 병렬 연산 최적화
         * GPU는 SM(Stream Multiprocessor) 단위로 연산을 수행하므로, 작은 타일로 나누면 더 많은 연산을 동시에 실행 가능
         * Tensor Core를 사용하는 경우에도, 적절한 크기의 타일을 사용하면 연산 속도가 향상됨
      3) 메모리 접근 패턴 개선
         * 데이터를 타일 단위로 접근하면 메모리 뱅크 충돌(bank conflict) 최소화
연속적인 메모리 접근이 가능해져 캐시 적중률(cache hit rate) 증가
         * 예) 한 번에 32개의 샘플을 처리하고 싶지만 GPU 메모리 제한으로 인해 8개씩만 처리할 수 있다면, 4번의 미니배치에서 그래디언트를 모은 후 한 번의 업데이트를 수행함.
     
 ✅ 예제: 행렬 곱셈에서의 타일링
   기본 행렬 곱셈 방식:
   𝐶 = 𝐴 × 𝐵
   일반적인 행렬 곱셈은 모든 행과 열을 순차적으로 계산하므로, 캐시 효율이 낮음.

   1) 타일링 적용:
    * 행렬을 작은 블록(타일) 단위로 나누어 캐시에서 효율적으로 처리
    * 작은 블록 내에서 연산을 먼저 수행한 후, 결과를 합치는 방식

   📌 Tensor Core를 활용하는 NVIDIA GPU에서는 특정 크기의 타일(예: 16x16, 32x32)을 사용하면 최적의 성능을 얻을 수 있음.

 ✅ 타일링을 적용하는 대표적인 기술
 
   🔹Loop Tiling / Blocking: CPU/GPU에서 for 루프 내의 연산을 블록 단위로 나누어 실행
   
   🔹Tensor Core 연산: NVIDIA Tensor Core는 특정 크기의 타일(예: 16x16)을 사용해 행렬 연산 가속
   
   🔹Image Processing (CNNs): 이미지 처리에서는 Convolution 연산에서 타일링을 활용하여 메모리 효율과 연산 속도를 향상
   
   🔹Transformer 모델 최적화: GPT, BERT 같은 대형 모델에서 self-attention 연산을 타일링하여 메모리 사용량 감소

✅ 결론 

 🔹 타일링은 메모리 접근 패턴을 최적화하고 병렬 연산을 최대한 활용하기 위한 필수적인 기법
 
 🔹 행렬 곱셈(GEMM), CNN, Transformer 등에서 성능을 극대화하는 데 사용
 
 🔹 적절한 타일 크기를 선택하면 Tensor Core와 같은 가속 하드웨어의 성능을 극대화할 수 있음

  🚀 즉, 타일링은 대규모 행렬 연산에서 성능을 극대화하는 필수적인 최적화 기법
