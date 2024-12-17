FROM busybox:latest as busybox-builder

WORKDIR /app
COPY . .

FROM alpine:latest

COPY --from=busybox-builder /app /app

CMD ["echo", "App is ready with BusyBox and Alpine!"]
