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
    && rm -rf /var/lib/apt/lists/*


COPY daemons /etc/frr/daemons
RUN chown frr:frr /etc/frr/daemons && \
    chmod 640 /etc/frr/daemons

RUN mkdir -p /var/run/frr && \
    chown -R frr:frr /var/run/frr && \
    chmod 775 /var/run/frr

RUN chown -R frr:frr /etc/frr && \
        chmod 640 /etc/frr/*.conf

COPY start.sh .

RUN chmod +x /start.sh

SHELL ["/bin/bash", "-c"]

CMD ["/start.sh"]
