git clone https://sheikheddy:$VAST_GH_TOKEN@github.com/sheikheddy/crosslayer-coding.git

cd crosslayer-coding && uv pip install -e .

uv pip install wandb 

wandb login $VAST_WB_TOKEN