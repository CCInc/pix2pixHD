FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-devel

RUN apt update && apt install -y wget unzip curl bzip2 git
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda && \
    conda install -y python=3.6.6 && \
    pip install --upgrade pip 
    
WORKDIR /home

RUN git clone --recursive https://github.com/NVIDIA/apex.git
RUN cd apex; pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./

RUN pip install dominate gdown
RUN conda install -y tensorflow"<2"

ADD https://api.github.com/repos/CCInc/pix2pixHD/git/refs/heads/master version.json
RUN git clone https://github.com/CCInc/pix2pixHD.git && cd pix2pixHD