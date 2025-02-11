### 2. 그래디언트 누적(Gradient Accumulation) ###

  * 전체 배치에 대한 그래디언트를 한 번에 계산하는 대신, 더 작은 단위로 점진적으로 계산하는 방식
  * 이 접근법에서는 모델을 통해 **순전파(forward pass) 및 역전파(backward pass)** 를 반복적으로 수행하면서 그래디언트를 누적한다.
  * 일정 횟수만큼 그래디언트가 누적되면, 그제서야 모델의 최적화(optimization) 단계가 실행
  * 그래디언트 누적을 활용하면 **GPU 메모리 한계를 초과하지 않으면서도 더 큰 효과적인 배치 크기(effective batch size)를 사용할 수 있게 된다**. 
  * 그러나 그래디언트 누적 과정에서 **추가적인 순전파 및 역전파 연산이 발생하므로 훈련 속도가 느려질 수 있음**을 유의해야 한다. 
  * 그래디언트 누적을 활성화하려면 `TrainingArguments`에 `gradient_accumulation_steps` 인자를 추가하면 된다. 

```
training_args = TrainingArguments(per_device_train_batch_size=1, gradient_accumulation_steps=4, **default_args)
```

위 예제에서 실제 배치 크기(effective batch size) 는 4가 된다. 또한, 훈련 루프에 대한 완전한 제어(full control) 를 원한다면 [🤗 Accelerate를](https://huggingface.co/docs/transformers/v4.48.2/en/perf_train_gpu_one#using--accelerate) 활용할 수도 있다. 

GPU 사용률을 최대한 활용하는 것이 권장되지만, 너무 많은 그래디언트 누적 단계(gradient accumulation steps)가 설정되면 훈련 속도가 더욱 느려질 수 있음을 유의해야 한다. 

예를 들어, per_device_train_batch_size=4가 GPU 메모리 한계에 도달했다고 가정해 보자. 만약 배치 크기 64로 훈련하고 싶다면, per_device_train_batch_size=1과 gradient_accumulation_steps=64로 설정하는 것은 비효율적이다. 

또는, `per_device_train_batch_size=4`로 유지하고, `gradient_accumulation_steps=16`으로 설정하면, 동일한 효과적인 배치 크기(effective batch size) 를 유지하면서도 GPU 리소스를 더 효율적으로 활용할 수 있다. 추가 정보는 RTX-3090 및 A100에서의 배치 크기 및 그래디언트 누적 벤치마크를 참고하라. 

