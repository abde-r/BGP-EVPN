FROM alpine:latest

RUN apk update && apk add --no-cache \
    bash \
    busybox \
    quagga \
    iproute2 \
    iputils \
    netcat-openbsd \
    && rm -rf /var/cache/apk/*

# Set up Quagga configuration directories and files
RUN mkdir -p /etc/quagga && \
    touch /etc/quagga/bgpd.conf /etc/quagga/ospfd.conf /etc/quagga/isisd.conf

# Copy the configuration files into the container (customize them as needed)
# COPY ./bgpd.conf /etc/quagga/bgpd.conf
# COPY ./ospfd.conf /etc/quagga/ospfd.conf
# COPY ./isisd.conf /etc/quagga/isisd.conf

# Set up the Quagga daemons (BGP, OSPF, and IS-IS)
RUN echo 'zebra=yes\nbgpd=yes\nospfd=yes\nisisd=yes' > /etc/quagga/daemons

# Expose necessary ports for routing services
EXPOSE 179 2604 2605 2601

# Start Quagga services and BusyBox
CMD /usr/sbin/zebra -d && \
    /usr/sbin/bgpd -d && \
    /usr/sbin/ospfd -d && \
    /usr/sbin/isisd -d && \
    /bin/sh
