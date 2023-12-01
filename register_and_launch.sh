#!/bin/bash
sleep 5
xinference register --persist --file /cosybio/project/LLM/xinference_configs/llama2-13b-chat-hf.json
xinference launch --model-name llama2-13b-chat-hf --size-in-billions 13 --model-format pytorch --quantization none --n-gpu 1
xinference launch --model-name qwen-chat --size-in-billions 14 --model-format pytorch --quantization none --n-gpu 1
xinference launch --model-name gte-large --model-type embedding
