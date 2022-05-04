FROM alpine:latest
RUN addgroup -S appgroup && adduser -S userali -G appgroup
RUN apk add --no-cache jq
RUN wget https://aliyuncli.alicdn.com/aliyun-cli-linux-latest-amd64.tgz
RUN apk add tzdata
RUN tar -xvzf aliyun-cli-linux-latest-amd64.tgz
RUN rm aliyun-cli-linux-latest-amd64.tgz
RUN mv aliyun /usr/local/bin/
WORKDIR /app
RUN apk add --no-cache libc6-compat musl
ENV TZ Asia/Shanghai
RUN chown -R userali:appgroup /app
USER userali
