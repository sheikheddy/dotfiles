#!/bin/bash

# 1) Install packages
sudo apt update; 
sudo apt update
sudo apt install -y build-essential \
libssl-dev \
zlib1g-dev \
libbz2-dev \
libreadline-dev \
libsqlite3-dev \
curl \
git \
libncursesw5-dev \
xz-utils \
tk-dev \
libxml2-dev \
libxmlsec1-dev \
libaom-dev \
libaribb24-dev \
brotli \
libbrotli-dev \
libc-ares-dev \
ca-certificates \
libcairo2-dev \
libcjson-dev \
cloc \
libdav1d-dev \
ffmpeg \
flac \
fontconfig \
libfreetype6-dev \
frei0r-plugins-dev \
libfribidi-dev \
fzf \
gettext \
gh \
libgif-dev \
git-lfs \
libglib2.0-dev \
libgmp-dev \
libgnutls28-dev \
libgraphite2-dev \
libharfbuzz-dev \
htop \
libicu-dev \
imagemagick \
libjpeg-turbo8-dev \
jq \
lame \
libleptonica-dev \
libarchive-dev \
libass-dev \
libbluray-dev \
libde265-dev \
libdeflate-dev \
libevent-dev \
libheif-dev \
libidn2-0-dev \
libmicrohttpd-dev \
libnghttp2-dev \
libogg-dev \
libomp-dev \
libpng-dev \
libraw-dev \
libsamplerate0-dev \
libsndfile1-dev \
libsodium-dev \
libsoxr-dev \
libssh-dev \
libtasn1-6-dev \
libtiff-dev \
libtool \
libunistring-dev \
libuv1-dev \
libvpx-dev \
libx11-dev \
libxcb1-dev \
libyaml-dev \
liblz4-dev \
m4 \
libmbedtls-dev \
mpdecimal \
mpg123 \
nano \
libncurses-dev \
nodejs \
ntfs-3g \
libopencore-amrnb-dev \
libopenexr-dev \
libopus-dev \
p11-kit-modules \
libpango1.0-dev \
libpcre2-dev \
libreadline-dev \
ripgrep \
rubberband-cli \
ruby \
libsdl2-dev \
shared-mime-info \
libsnappy-dev \
libspeex-dev \
libsqlite3-dev \
svt-av1 \
telnet \
tesseract-ocr \
tmux \
unbound \
visidata \
webp \
wget \
libx264-dev \
libx265-dev \
xorg-dev \
xz-utils \
libzmq3-dev \
zoxide \
zstd

# 2) Add aliases and environment variables to .bashrc

echo "export HF_HOME=/workspace/hf" >> /root/.bashrc
echo "export HF_HUB_ENABLE_HF_TRANSFER=1" >> /root/.bashrc

# 3) Install CUDA instead of relying on template
wget https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/cuda_12.1.0_530.30.02_linux.run
sudo sh cuda_12.1.0_530.30.02_linux.run
sudo apt-get install -y nvidia-cuda-toolkit

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