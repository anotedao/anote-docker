ARG NODE_TAG=latest
FROM wavesplatform/wavesnode:$NODE_TAG
COPY waves.custom.conf /etc/waves/waves.conf
COPY application.custom.ini /etc/waves/application.ini
COPY anote-node /var/lib/anote/anote-node
COPY install.sh /var/lib/anote/install.sh
ENV WVLOG=/var/log/anote
ENV WVDATA=/var/lib/anote
ENV WAVES_HEAP_SIZE=480m

WORKDIR $WVDATA