FROM        node:16.13.0-alpine

WORKDIR     /app

RUN         apk add --no-cache --update fontconfig ffmpeg bash iproute2 git sqlite sqlite-dev python3 python3-dev ca-certificates tzdata zip tar curl g++ make \
            && npm install -g npm@latest \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
