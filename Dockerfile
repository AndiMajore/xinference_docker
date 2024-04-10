FROM xprobe/xinference:latest

WORKDIR /opt/conda/lib/python3.10/

RUN pip install huggingface_hub
RUN pip install gradio==3.50.2
RUN pip install flash-attn

COPY ./launch_script.sh .
COPY ./register_and_launch.sh .
COPY ./login.py .
