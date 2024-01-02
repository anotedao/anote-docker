ARG NODE_TAG=latest
FROM wavesplatform/wavesnode:$NODE_TAG
COPY waves.custom.conf /etc/waves/waves.conf
COPY application.custom.ini /etc/waves/application.ini
ENV WVLOG=/var/log/anote
ENV WVDATA=/var/lib/anote

WORKDIR $WVDATA