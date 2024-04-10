#!/bin/bash
sleep 15
if [ -f /config.json ]; then
   xinference login -e http://127.0.0.1:9997 --username $ADMIN_USER --password $ADMIN_PASSWORD
fi
#xinference launch --model-name llama-2-chat --size-in-billions 13 --model-format pytorch --quantization none  --n-gpu 1
#xinference launch --model-name llama2-13b-hf --size-in-billions 13 --model-format pytorch --quantization none --n-gpu 1
xinference launch --model-name mixtral-instruct-v0.1 --size-in-billions 46_7 --model-format pytorch --quantization 8-bit -u mixtral-8x7B-instruct-v01 --n-gpu 4
#xinference launch --model-name llama-2-chat --size-in-billions 13 --model-format pytorch --quantization none  --n-gpu 2
#xinference launch --model-name gemma-it --size-in-billions 2 --model-format pytorch --quantization none --n-gpu auto
xinference launch --model-name gte-large --model-type embedding
xinference launch --model-name bge-reranker-large --model-type rerank
