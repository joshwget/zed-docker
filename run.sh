docker run -it \
  --device=/dev/video0 \
  --device=/dev/nvhost-ctrl \
  --device=/dev/nvhost-ctrl-gpu \
  --device=/dev/nvhost-prof-gpu \
  --device=/dev/nvmap \
  --device=/dev/nvhost-gpu \
  --device=/dev/nvhost-as-gpu \
  -v /usr/local/cuda/lib64:/usr/local/cuda/lib64 \
  -v /etc/alternatives:/etc/alternatives \
  -v /usr/lib/aarch64-linux-gnu:/usr/lib/aarch64-linux-gnu \
  -e LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/lib/aarch64-linux-gnu:/usr/lib/aarch64-linux-gnu/tegra \
  zed
