# Using a ZED camera with Docker

Understanding the [guide for using Jetson Nano with Docker](https://github.com/joshwget/jetson-nano-docker) is a prereq for this guide.

These lines are the most important part of the Dockerfile.

```
RUN wget https://download.stereolabs.com/zedsdk/2.8/jetson_jp42 \
  && chmod +x jetson_jp42 \
  && ./jetson_jp42 silent
```

This is the installer for the ZED SDK. It can be installed as part of the build process for your container image. This is the only part of the Dockerfile you'd use if you were running your own code using the ZED SDK and not just one of their tutorials.

The Dockerfile copies in `ZED_Tutorial_1` which is just a binary compiled from one of the ZED tutorials.

You can build the container image by running this commmand.

```
docker build -t zed .
```


This is the command to run the container. It's the same as in the guide for using Jetson Nano with Docker except it adds `--device=/dev/video0` which allows the container to access the camera.

```
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
```

If successful you should see something like this.

```
Hello! This is my serial number: 23921
```
