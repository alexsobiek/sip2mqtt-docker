# -*- Dockerfile -*-
# MAINTAINER MartyTremblay

FROM alpine:3.10
ENV LANG=C.UTF-8

ARG VERSION_PJSIP=2.10

RUN apk add --no-cache python2 py2-paho-mqtt unzip

RUN python -m ensurepip
RUN pip install --upgrade pip setuptools

RUN rm -r /root/.cache \ 
  && apk add --no-cache --virtual .build4pjsip alpine-sdk \
  && apk add --no-cache libsrtp-dev python2-dev openssl-dev linux-headers

#  RUN curl -L -s -S https://raw.githubusercontent.com/MartyTremblay/sip2mqtt/master/sip2mqtt.py -o /opt/sip2mqtt/sip2mqtt.py 
RUN curl -LO -s -S "https://github.com/pjsip/pjproject/archive/refs/tags/${VERSION_PJSIP}.zip"
RUN unzip "${VERSION_PJSIP}.zip"
RUN cd "pjproject-${VERSION_PJSIP}" \
  && ./configure \
  --with-external-srtp \
  --enable-shared \
  --disable-sound \
  --disable-sdl \
  --disable-speex-aec \
  --disable-video \
  --prefix=/usr/local > /dev/null \
  \
  && make dep \
  && make \
  && make install \
  && cd pjsip-apps/src/python \
  && make \
  && make install \
  && rm -rf "pjproject-${VERSION_PJSIP}"

RUN apk del .build4pjsip

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Give execute permission to the script
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]