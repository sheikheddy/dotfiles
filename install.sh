#!/bin/bash

# 1) Install packages
sudo apt update; sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl git libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev 

# 2) Add aliases and environment variables to .bashrc

echo "export HF_HOME=/workspace/hf" >> /root/.bashrc
echo "export HF_HUB_ENABLE_HF_TRANSFER=1" >> /root/.bashrc

# 3) Install CUDA instead of relying on template
wget https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/cuda_12.1.0_530.30.02_linux.run
sudo sh cuda_12.1.0_530.30.02_linux.run
sudo apt-get install nvidia-cuda-toolkit

# Source
source /root/.bashrc

# 4) Set up huggingface cache at /workspace/hf
uv pip install -U "huggingface_hub[cli]"
uv pip install -U "huggingface-hub[hf-transfer]"
source /root/.venv/bin/activate

if [ -z "$VAST_HF_TOKEN" ]; then
    huggingface-cli login --add-to-git-credential
else
    huggingface-cli login --token $VAST_HF_TOKEN --add-to-git-credential
fi