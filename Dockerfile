FROM andimajore/mamba_nvidia_ubuntu:latest

RUN apt-get update && apt-get install -y build-essential
RUN apt-get install libnccl2 libnccl-dev
RUN mamba install python=3.10
RUN mamba install -c conda-forge cxx-compiler diffusers

# Install all xinference dependencies
#RUN pip install llama-cpp-python==0.2.20
#ARG CMAKE_ARGS="-DLLAMA_CUBLAS=on" pip install llama-cpp-python
#RUN pip install xinference[all]==0.8.4
RUN pip install xinference[transformers]==0.9.0
#RUN pip install xinference[vllm]==0.9.0
#RUN mamba install git
#RUN git clone https://github.com/AndiMajore/inference.git

#RUN pip install -y pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch-nightly -c nvidia
RUN pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu121

#RUN python -m cupyx.tools.install_library --library nccl --cuda 12.1
RUN pip install sentence-transformers

WORKDIR /opt/conda/lib/python3.9/

RUN pip install huggingface_hub

COPY ./launch_script.sh .
COPY ./register_and_launch.sh .
COPY ./login.py .
