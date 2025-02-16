FROM alpine:latest
RUN apk add --no-cache busybox
CMD ["/bin/sh"]
