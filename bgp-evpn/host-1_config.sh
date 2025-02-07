ip link set eth0 down
ip link set eth0 name eth1
ip link set eth1 up
ip addr add 20.1.1.1/24 dev eth1