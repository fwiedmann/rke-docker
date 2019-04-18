FROM alpine:3.7

LABEL maintainer="Lukas Bahr lukas@devopoly.de"

ARG RKE_VERSION=$STAGE

WORKDIR /deployment

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

RUN apk --no-cache add wget ca-certificates git bash openssh-client && \
    wget -O /usr/local/bin/rke https://github.com/rancher/rke/releases/download/${RKE_VERSION}/rke_linux-amd64 && \
    chmod +x /usr/local/bin/rke 

RUN adduser -S rke \
    -h /home/rke \
    -u 2000 \
    rke

ENTRYPOINT ["./entrypoint.sh"]
CMD [""]
