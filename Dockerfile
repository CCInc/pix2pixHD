FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-devel

WORKDIR /workspace
RUN git clone --recursive https://github.com/NVIDIA/apex.git
RUN cd apex; pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
RUN pip install scipy==1.1.0

RUN pip install dominate gdown
RUN conda install -y tensorflow"<2"

ADD https://api.github.com/repos/CCInc/pix2pixHD/git/refs/heads/master version.json
RUN git clone https://github.com/CCInc/pix2pixHD.git && cd pix2pixHD