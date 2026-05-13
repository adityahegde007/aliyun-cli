FROM alpine:3.20

RUN addgroup -S appgroup && adduser -S userali -G appgroup \
    && apk add --no-cache jq tzdata libc6-compat musl \
    && wget -q https://aliyuncli.alicdn.com/aliyun-cli-linux-latest-amd64.tgz \
    && tar -xzf aliyun-cli-linux-latest-amd64.tgz \
    && rm aliyun-cli-linux-latest-amd64.tgz \
    && mv aliyun /usr/local/bin/ \
    && chmod 555 /usr/local/bin/aliyun \
    && mkdir -p /app \
    && chown -R userali:appgroup /app

ENV TZ=Asia/Shanghai

WORKDIR /app
USER userali

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD aliyun version || exit 1


