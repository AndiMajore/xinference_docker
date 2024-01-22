FROM andimajore/mamba_nvidia_ubuntu:latest

RUN apt-get update && apt-get install -y build-essential
RUN mamba install python=3.10
RUN mamba install -c conda-forge cxx-compiler

# Install all xinference dependencies
RUN pip install xinference[all]==0.8.1

RUN mamba install -y pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch-nightly -c nvidia

WORKDIR /opt/conda/lib/python3.9/

RUN pip install huggingface_hub

COPY ./launch_script.sh .
COPY ./register_and_launch.sh .
COPY ./login.py .
