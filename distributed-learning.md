# Performance and Scalability #

대규모 트랜스포머 모델을 학습하고 이를 프로덕션 환경에 배포하는 과정에는 여러 가지 도전 과제가 존재한다. 따라서, 학습 단계에서는 모델이 사용 가능한 GPU 메모리보다 많은 메모리를 요구하거나 학습 속도가 느릴 수 있다. 반면, 배포 단계에서는 프로덕션 환경에서 요구되는 처리량을 모델이 감당하지 못하는 문제가 발생할 수 있다.

이 문서는 이러한 문제들을 극복하고 사용 사례에 최적화된 설정을 찾는 데 도움을 주기 위해 작성했다. 학습과 추론 영역으로 구분되어 있으며, 각각은 다른 문제점과 해결책을 제시한다. 각 섹션 내에서는 학습 시 단일 GPU와 다중 GPU, 추론 시 CPU와 GPU 등 다양한 하드웨어 구성에 대한 별도의 가이드를 찾을 수 있다.

### 훈련 ###

대규모 트랜스포머 모델을 효율적으로 훈련하려면, GPU나 TPU와 같은 가속기가 필요함. 가장 일반적인 경우는 단일 GPU를 사용하는 경우이고, 단일 GPU에서 훈련 효율을 개선하기 위해 적용할 수 있는 방법들은 다중 GPU와 같은 다른 구성에서도 확장할 수 있다. 그래서 다중 GPU나 CPU 훈련 시 특화된 기술들도 존재하는 것을 명심하라. 

  * [단일 GPU에서 효율적인 학습을 위한 방법과 도구](https://huggingface.co/docs/transformers/v4.48.2/perf_train_gpu_one): GPU 메모리 활용도를 최적화하거나 학습 속도를 높이는 일반적인 접근 방식을 설명함. 

  * [다중 GPU 를 이용한 훈련 방법](https://huggingface.co/docs/transformers/v4.48.2/perf_train_gpu_many): 데이터, 텐서, 파이프라인 병렬 처리와 같이 다중 GPU 환경에 적용할 수 있는 추가 최적화 방법을 설명함. 

  * [CPU 훈련 영역](https://huggingface.co/docs/transformers/v4.48.2/perf_train_cpu): CPU에서의 혼합 정밀도 학습

  * [여러 CPU에서의 효율적인 훈련](https://huggingface.co/docs/transformers/v4.48.2/perf_train_cpu_many): 분산 CPU 학습

  * [TensorFlow를 활용한 TPU 훈련](https://huggingface.co/docs/transformers/v4.48.2/perf_train_tpu_tf): TPU 사용이 처음이라면, TPU 학습 및 XLA 사용에 대한 방법 소개

  * [훈련용 맞춤 하드웨어](https://huggingface.co/docs/transformers/v4.48.2/perf_hardware): 자신만의 딥러닝 장비를 구축할 때 

  * [Trainer API를 활용한 하이퍼파라미터 탐색](https://huggingface.co/docs/transformers/v4.48.2/hpo_train)

### 추론 ###

대규모 형태의 모델을 프로덕션 환경에서 효율적으로 추론하는 것은 훈련만큼이나 어려울 수 있다. 아래의 부분에서는 CPU 및 단일/다중 GPU 환경에서 추론을 수행하는 방법을 정리했다. 

  * [단일 CPU에서의 추론](https://huggingface.co/docs/transformers/v4.48.2/en/perf_infer_cpu)
  * [단일 GPU에서의 추론](https://huggingface.co/docs/transformers/v4.48.2/en/perf_infer_gpu_one)
  * [다중 GPU 추론](https://huggingface.co/docs/transformers/v4.48.2/en/perf_infer_gpu_multi)
  * [추론 디버깅](https://huggingface.co/docs/transformers/v4.48.2/en/debugging)
  * [torch.compile()를 이용한 추론 최적화](https://huggingface.co/docs/transformers/v4.48.2/en/perf_torch_compile)
  * [대형 모델 인스턴스화](https://huggingface.co/docs/transformers/v4.48.2/en/big_models)
  * [TensorFlow 모델의 XLA 통합](https://huggingface.co/docs/transformers/v4.48.2/en/tf_xla)

### 중요: 추론 최적화 ###

  * [TensorRT-LLM 이용하는 방법]
  * [Ollama를 이용하는 방법]
  * [vLLM을 이용하는 방법]

