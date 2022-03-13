FROM        node:16.13.0-alpine

WORKDIR     /app

RUN         apk add --no-cache --update tzdata libc6-compat ffmpeg \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
