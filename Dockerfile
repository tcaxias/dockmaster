FROM tcaxias/python
MAINTAINER Tiago Caxias http://github.com/tcaxias

ENV \
    DEPS="build-base zlib-dev lz4-dev git bash" \
    PYPI="pykafka" \
    APK="apk --update --no-cache" \
    ENDPOINTS="kafka://127.0.0.1:9092/dockmaster"

WORKDIR /app

RUN \
    $APK add $DEPS && \
    cd /tmp && \
    git clone https://github.com/edenhill/librdkafka.git . && \
    ./configure && \
    make && \
    make install && \
    cd /app && \
    pip install $PYPI && \
    rm -rf /tmp && \
    $APK del $DEPS

ADD dockmaster /app

CMD ["python3", "dockmaster"]
