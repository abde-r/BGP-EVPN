ip link add vxlan10 type vxlan id 10
ip link set up dev vxlan10

vtysh

config t

hostname VTEP_aelasri-2

# eth0 interface config
interface eth0
ip address 10.1.1.2/30
ip ospf area 0

# loopback interface config
interface lo
ip address 1.1.1.2/32
ip ospf area 0

# vxlan config
interface vxlan10
vxlan source-interface lo
vxlan vni 5000

# bgp config
router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo
