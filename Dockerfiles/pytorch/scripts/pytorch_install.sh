#!/bin/bash

# PyTorch
if [[ ${CUDA_VERSION} = 10.2* ]]
then
    pip install "torch==${PYTORCH_VERSION}"
else
    CUDA_VERSION=$(echo "${CUDA_VERSION}" | cut -d'-' -f'1' | sed 's/\.//g')
    pip install "torch==${PYTORCH_VERSION}+cu${CUDA_VERSION}" --find-links https://download.pytorch.org/whl/torch_stable.html
fi

# NVIDIA apex
git clone https://github.com/NVIDIA/apex
cd apex || exit
python setup.py install
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
