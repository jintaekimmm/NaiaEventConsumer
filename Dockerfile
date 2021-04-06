FROM golang:1.16-alpine
LABEL maintainer="Jintae, Kim <6199@outlook.kr>"

COPY . /app
ENV HOME=/app

# Build Argument Set
ARG ELS_HOST
ARG ELS_USER
ARG ELS_PASSWORD
ARG ELS_INDEX
ARG NOUNS_API
ARG BROKER
ARG TOPICS
ARG ConsumerGroup

# Env Set
ENV ELS_HOST=${ELS_HOST}
ENV ELS_USER=${ELS_USER}
ENV ELS_PASSWORD=${ELS_PASSWORD}
ENV ELS_INDEX=${ELS_INDEX}
ENV NOUNS_API=${NOUNS_API}
ENV BROKER=${BROKER}
ENV TOPICS=${TOPICS}
ENV ConsumerGroup=${ConsumerGroup}

# Timezone Set
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# Build
WORKDIR ${HOME}
RUN apk --no-cache add tzdata && go build main.go

ENTRYPOINT ["./main"]