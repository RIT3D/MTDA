FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-devel
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
RUN echo "M3TDA Enviorments"

# set userinfo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# copy files
RUN mkdir -p /backup
COPY ./ /backup

# Install denpendies
RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-get update
RUN apt-get install -y libglib2.0-0 libgl1-mesa-dev

# Segmentation
RUN pip install -r /backup/requirements.txt
RUN pip install mmcv-full==1.3.7

# # Detection

# # Classfication
# RUN pip -r /workspace/MTDA/cls/requirements.txt

