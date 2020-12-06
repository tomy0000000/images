#!/bin/bash
if [[ ${CUDA_VERSION} = 10.2* ]]
then
    pip install torch==${PYTORCH_VERSION}
else
    CUDA_VERSION=`echo ${CUDA_VERSION} | cut -d'.' -f'1-2' | sed 's/\.//g'`
    pip install torch==${PYTORCH_VERSION}+cu${CUDA_VERSION} --find-links https://download.pytorch.org/whl/torch_stable.html
fi
