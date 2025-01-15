#!/bin/bash

# Creating bridge interface
sudo ip link add br0 type bridge
sudo ip link set dev br0 up
sudo ip addr add 10.1.1.2/24 dev eth0

# Creating vxlan interface
sudo ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.2 local 10.1.1.1 dstport 4789
sudo ip addr add 20.1.1.2/24 dev vxlan10
sudo ip link set dev vxlan10 up

echo "Bridge & Vxlan setup completed successfully."
