FROM ubuntu:20.04

RUN \
  apt-get update && \
  apt-get install -y wget nano

# installing miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda
ENV PATH=$PATH:/miniconda/condabin:/miniconda/bin

# install libraries for the base environment
RUN conda install numpy scikit-learn ipykernel

# update kernelspec to load our custom environment strored on EFS
RUN rm -rf /miniconda/share/jupyter/kernels/python3
COPY custom_kernel_spec/ /miniconda/share/jupyter/kernels/python3

