

NVIDIA에서 단 2주 만에 3.2배의 처리량 증가를 달성하여 더욱 비용 효율적인 DeepSeek-R1 추론을 구현한 결과를 보여준 그래프이다. 

[그림 1 - ]

강력한 FP8 텐서 코어와 높은 대역폭의 NVLink 및 NVSwitch 인터커넥트를 갖춘 NVIDIA Hopper GPU에서 SGLang을 실행하는 DeepSeek-R1 와 TensorRT LLM을 통해 얼마나 성능 향상 했는지 한 눈에 보여준다. 

이 결과는 8개의 GPU를 탑재한 HGX H200 시스템에서 실행했다. 이것은 LLM과 하드웨어 인프라가 동일하더라도 소프트웨어 엔지니어링을 통해 모델의 추론을 얼마나 효율적으로 향상 시킬 수 있는지 보여주는 예이다. 

참고로 SGLang은 DeepSeek 모델, 특히 DeepSeek-V3/R1을 배포하는 데 권장하는 추론 엔진을 말한다. 현재 SGLang은 MLA 최적화, DP Attention, FP8 (W8A8), FP8 KV Cache, 그리고 Torch Compile을 지원해 최첨단의 지연 시간 및 처리량 성능을 제공한다. 또한, vLLM이나 Groq 와 쌍벽을 이루는 추론 엔진이다. 

특히, SGLang v0.4.1은 NVIDIA와 AMD GPU 모두에서 DeepSeek-V3를 완벽하게 실행할 수 있도록 지원한다. 또한 멀티 노드 상에서 텐서 병렬 처리를 지원해 여러 네트워크에 연결된 머신에서 이 모델을 실행할 수 있다. 
