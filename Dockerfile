FROM andimajore/mamba_nvidia_ubuntu:latest

RUN mamba install python=3.9
RUN apt-get install -y nodejs npm
RUN mamba install -c conda-forge cxx-compiler
# Install all xinference dependencies
RUN pip install xinference[all]

RUN mamba install git

# Install specific xinference version
ARG CACHEBUST=5
RUN git clone https://github.com/AndiMajore/inference.git

RUN pip install ./inference
WORKDIR ./inference/xinference/web/ui
RUN npm install
RUN npm run build
RUN cp -r ./build /opt/conda/lib/python3.9/site-packages/xinference/web/ui/build

WORKDIR /opt/conda/lib/python3.9/

RUN pip install huggingface_hub

COPY ./launch_script.sh .
COPY ./register_and_launch.sh .
COPY ./login.py .
