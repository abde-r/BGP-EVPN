FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    frr \
    frr-pythontools \
    iproute2 \
    net-tools \
    tcpdump \
    vim \
    telnet \
    bash \
    bridge-utils \
    && rm -rf /var/lib/apt/lists/*

# Enable IP forwarding
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf && \
    sysctl -p

# Copy FRR configuration
COPY daemons /etc/frr/daemons
RUN chown frr:frr /etc/frr/daemons && \
    chmod 640 /etc/frr/daemons

# Prepare FRR runtime directory
RUN mkdir -p /var/run/frr && \
    chown -R frr:frr /var/run/frr && \
    chmod 775 /var/run/frr

# Set correct permissions for FRR configuration
RUN chown -R frr:frr /etc/frr && \
    chmod 640 /etc/frr/*.conf

# Copy and set up start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

SHELL ["/bin/bash", "-c"]

CMD ["/start.sh"]