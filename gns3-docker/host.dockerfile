FROM alpine:latest
RUN apk add --no-cache busybox
CMD ["tail", "-f", "/dev/null", "/bin/sh"]
