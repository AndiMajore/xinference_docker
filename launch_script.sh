#!/bin/bash
python login.py
bash ./register_and_launch.sh &

xinference-local -H 0.0.0.0
