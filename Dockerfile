# Base image must at least have pytorch and CUDA installed.
ARG BASE_IMAGE=nvcr.io/nvidia/pytorch:19.02-py3
FROM $BASE_IMAGE

RUN python --version
RUN pip --version

RUN apt update && apt install -y wget unzip curl bzip2 git
RUN pip install --upgrade pip 

RUN pip install dominate gdown
RUN conda install -y tensorflow"<2"

WORKDIR /home
ADD https://api.github.com/repos/CCInc/pix2pixHD/git/refs/heads/master version.json
RUN git clone https://github.com/CCInc/pix2pixHD.git && cd pix2pixHD
