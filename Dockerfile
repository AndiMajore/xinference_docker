FROM andimajore/mamba_nvidia_ubuntu:latest

RUN apt-get update && apt-get install -y build-essential
RUN mamba install python=3.9
RUN mamba install -c conda-forge cxx-compiler

# Install all xinference dependencies
RUN pip install xinference[all]

RUN mamba install git

WORKDIR /opt/conda/lib/python3.9/

RUN pip install huggingface_hub

COPY ./launch_script.sh .
COPY ./register_and_launch.sh .
COPY ./login.py .
