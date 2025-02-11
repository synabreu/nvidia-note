# 그래디언트 체크포인팅 #

일부 대형 모델은 배치 크기를 1로 설정하고 그래디언트 누적(gradient accumulation)을 사용하더라도 여전히 메모리 문제를 겪을 수 있다. 이는 훈련 과정에서 메모리를 소비하는 다양한 요소들이 존재하기 때문이다. 

순전파(forward pass) 과정에서 모든 활성화 값(activation)을 저장한 후, 역전파(backward pass) 시 이를 활용하여 그래디언트를 계산하는 방식은 큰 메모리 오버헤드를 초래할 수 있다. 반대로, 활성화 값을 저장하지 않고 필요할 때마다 다시 계산하는 방식은 계산량이 급증하여 훈련 속도가 현저히 느려지는 문제가 발생할 수 있다. 다시 말해, 그래디언트 체크포인트는 메모리 효율성을 향상시킬 수 있지만, 훈련 속도를 약 20% 정도 느리게 만든다. 

그래디언트 체크포인트(Gradient Checkpointing)는 이러한 두 가지 접근 방식 사이에서 균형을 맞추는 최적화 기법이다. 

✅ 계산 그래프 내에서 **전략적으로 선택된 활성화 값만 저장**하여 메모리 사용량을 줄이고,  
✅ 필요한 경우 일부 활성화 값만 다시 계산하여 **훈련 속도를 최적화**합니다.  

그래디언트 체크포인트에 대한 자세한 설명은 [이 미디엄 블로그를](https://medium.com/tensorflow/fitting-larger-networks-into-memory-583e3c758ff9) 참고하라.   

[Trainer에서](https://huggingface.co/docs/transformers/v4.48.2/en/main_classes/trainer#transformers.Trainer) 그래디언트 체크포인트를 활성화하려면, [`TrainingArguments`에](https://huggingface.co/docs/transformers/v4.48.2/en/main_classes/trainer#transformers.TrainingArguments) 해당 플래그를 전달하면 된다. 

```
training_args = TrainingArguments(
    per_device_train_batch_size=1, // 각 GPU(또는 CPU)에서 한 번에 처리하는 배치 크기를 1로 설정
    gradient_accumulation_steps=4, // Gradient Accumulation Step 수를 4로 설정. 4개의 미니배치를 처리한 후에 한 번의 최적화(Optimizer Step)를 수행
    gradient_checkpointing=True,
    **default_args
)
```

🔹 per_device_train_batch_size=1
   - 각 GPU(또는 CPU)에서 한 번에 처리하는 배치 크기를 1로 설정
   - 일반적으로 대형 모델에서 GPU 메모리 부족을 방지하기 위해 작은 배치 크기를 사용
   - 하지만 너무 작은 배치 크기는 모델의 수렴 속도를 느리게 할 수도 있음 → gradient_accumulation_steps와 함께 사용하여 효과적인 배치 크기 증가

  🔹 gradient_accumulation_steps=4
    - 그래디언트 누적(Gradient Accumulation) 스텝 수를 4로 설정, 
    - 즉, 4개의 미니배치를 처리한 후에 한 번의 최적화(Optimizer Step)를 수행
    - GPU 메모리가 부족할 때 유용
      → per_device_train_batch_size=1이지만, 내부적으로 4개의 샘플을 처리한 후 가중치 업데이트
      → 결과적으로 효과적인 배치 크기(effective batch size) = 4로 증가
    - 단점: 추가적인 순전파 & 역전파 연산이 필요하여 훈련 속도가 다소 느려질 수 있음

🔹 gradient_checkpointing=True
    - 메모리 사용량을 줄이기 위한 그래디언트 체크포인트 기능 활성화
    - 순전파(forward pass) 시 일부 활성화 값(activations)을 저장하지 않고 필요할 때 다시 계산
    - 장점: 메모리 사용량 절감 (특히 대형 모델에서 효과적)
    - 단점: 계산량 증가 → 일부 활성화 값을 다시 계산해야 하므로 훈련 속도가 느려질 수 있음
    - 초거대 모델을 GPU에서 효율적으로 학습할 때 필수적인 기법

  🔹 **default_args
    - default_args는 다른 기본 훈련 설정을 포함하는 딕셔너리로 추정됨
    - 예를 들면, 학습률(learning_rate), 체크포인트 저장 경로(output_dir), 훈련 에포크 수(num_train_epochs) 등이 포함될 수 있음
    - 기존 설정을 유지하면서 위의 파라미터들만 추가로 지정하는 역할

### 결론 ###
 ✅ GPU 메모리가 부족한 환경에서도 대형 모델을 효과적으로 훈련할 수 있도록 구성
 ✅ 배치 크기를 1로 낮추고 그래디언트 누적으로 효과적인 배치 크기 증가
 ✅ 그래디언트 체크포인트를 활용하여 메모리 사용량 절감
 ✅ 추가적인 계산 오버헤드는 있지만, 메모리 부족 문제를 해결하면서 안정적으로 훈련 가능

 🚀 즉, 이 설정은 "메모리가 부족한 환경에서 초거대 모델을 안정적으로 훈련하는 최적화된 방법"이다.  

### 다른 대안 ###

그렇지 않으면, 허깅페이스의 Accelerate를 사용할 수도 있습니다. 허깅페이스 Accelerate를 활용한 예제는 여기를 참고하라.





