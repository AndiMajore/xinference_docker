#!/bin/bash
sleep 15
if [ -f /config.json ]; then
   xinference login -e https://llm.cosy.bio --username $ADMIN_USER --password $ADMIN_PASSWORD
fi
#xinference register --persist --file /cosybio/project/LLM/xinference_configs/llama2-13b-chat-hf-untouched.json
#xinference register --persist --file /cosybio/project/LLM/xinference_configs/llama2-13b-hf-untouched.json
#xinference register --persist --file /cosybio/project/LLM/xinference_configs/phi-2.json
#xinference register --persist --file /cosybio/project/LLM/xinference_configs/mixstral-8x7B-instruct.json
xinference launch --model-name llama-2-chat --size-in-billions 13 --model-format pytorch --quantization none  --n-gpu 1
#xinference launch --model-name llama2-13b-hf --size-in-billions 13 --model-format pytorch --quantization none --n-gpu 1
xinference launch --model-name mixtral-instruct-v0.1 --size-in-billions 46_7 --model-format pytorch -u mixtral-8x7B-instruct-v01 --n-gpu 3
xinference launch --model-name gte-large --model-type embedding
xinference launch --model-name bge-reranker-large --model-type rerank
