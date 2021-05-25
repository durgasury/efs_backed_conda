#!/bin/bash
docker run -it -p 8888:8888 -v /home/ubuntu/home_folder:/root conda_image bash -c 'pip install jupyter_kernel_gateway  && jupyter-kernelgateway --ip 0.0.0.0 --debug --port 8888'

