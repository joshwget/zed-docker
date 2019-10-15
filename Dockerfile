FROM arm64v8/ubuntu:18.04

RUN apt-get update && apt-get install -y build-essential cmake curl wget

RUN wget https://download.stereolabs.com/zedsdk/2.8/jetson_jp42 \
  && chmod +x jetson_jp42 \
  && ./jetson_jp42 silent

COPY ZED_Tutorial_1 /ZED_Tutorial_1

CMD [ "/ZED_Tutorial_1" ]
