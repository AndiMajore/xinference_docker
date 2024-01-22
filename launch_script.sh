#!/bin/bash
python login.py
bash ./register_and_launch.sh &

#xinference-local -H 0.0.0.0
#xinference-local -H https://llm.cosy.bio

if [ -f /config.json ]; then
    xinference-local -H 0.0.0.0 --auth-config /config.json
else
    xinference-local -H 0.0.0.0
fi
