FROM andimajore/mamba_nvidia_ubuntu:latest

RUN apt-get update && apt-get install -y build-essential
RUN apt-get install libnccl2 libnccl-dev
RUN mamba install python=3.10
RUN mamba install -c conda-forge cxx-compiler diffusers

# Install all xinference dependencies
#RUN pip install xinference[transformers]==0.9.0
RUN pip install xinference==0.9.4

#RUN pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

RUN pip install sentence-transformers

WORKDIR /opt/conda/lib/python3.9/

RUN pip install huggingface_hub

COPY ./launch_script.sh .
COPY ./register_and_launch.sh .
COPY ./login.py .
