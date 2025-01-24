vtysh

config t

hostname VTEP_aelasri-4

# eth0 interface config
interface eth0
ip address 10.1.1.4/30
ip ospf area 0

# lo interface config
interface lo
ip address 1.1.1.4/32
ip ospf area 0

# bgp config
router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo
