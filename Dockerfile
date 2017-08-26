FROM openjdk:8-jdk-alpine

COPY scripts /app/nxt

WORKDIR /app

RUN apk add --no-cache --virtual build unzip curl && \
    curl -Lo nxt-client-1.11.8.zip https://bitbucket.org/Jelurida/nxt/downloads/nxt-client-1.11.8.zip && \
    unzip nxt-client-1.11.8.zip && \
    apk del --no-cache build && \
    rm -rf nxt-client-1.11.8.zip && \
    ln -s /data/nxt_db /app/nxt/nxt_db

WORKDIR /app/nxt

VOLUME /data

EXPOSE 7876

ENTRYPOINT ["/app/nxt/start_docker.sh"]
