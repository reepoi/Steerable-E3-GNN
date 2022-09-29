FROM continuumio/miniconda3:4.12.0

ENV NVIDIA_VISIBLE_DEVICES=all

ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

ENV CUDA_VERSION=11.0.0

ENV LD_LIBRARY_PATH="/usr/local/cuda-11.0/lib64:$LD_LIBRARY_PATH"

RUN apt-get -y update

RUN apt -y install build-essential

RUN apt-get -y install git

COPY . .

ENV SEGNN_ENV_NAME=segnn

RUN conda env create --name $SEGNN_ENV_NAME --file environment.yml

RUN conda activate $SEGNN_ENV_NAME

RUN bash run.sh charge true

ENV CUDA_VISIBLE_DEVICES=0

LABEL taost=taost

ENV PORT=8800

EXPOSE 8800

CMD bash run.sh charge false

