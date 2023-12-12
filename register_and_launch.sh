#!/bin/bash
sleep 10
xinference register --persist --file /cosybio/project/LLM/xinference_configs/llama2-13b-chat-hf-untouched.json
xinference register --persist --file /cosybio/project/LLM/xinference_configs/llama2-13b-hf-untouched.json
xinference launch --model-name llama2-13b-chat-hf --size-in-billions 13 --model-format pytorch --quantization none --n-gpu 1
xinference launch --model-name llama2-13b-hf --size-in-billions 13 --model-format pytorch --quantization none --n-gpu 1
xinference launch --model-name gte-large --model-type embedding
xinference launch --model-name bge-reranker-large --model-type rerank
