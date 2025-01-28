ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up
brctl addif br0 vxlan10
brctl addif br0 eth0

hostname VTEP_aelasri-4
no ipv6 forwarding
!
interface eth2
 ip address 10.1.1.10/30
 ip ospf area 0
!
interface lo
 ip address 1.1.1.4/32
 ip ospf area 0
!
router bgp 1
 neighbor 1.1.1.1 remote-as 1
 neighbor 1.1.1.1 update-source lo
 !
 address-family l2vpn evpn
  neighbor 1.1.1.1 activate
  advertise-all-vni
 exit-address-family
!
router ospf
!

###

# vtysh

# config t

# hostname VTEP_aelasri-4

# # eth0 interface config
# interface eth0
# ip address 10.1.1.4/30
# ip ospf area 0

# # lo interface config
# interface lo
# ip address 1.1.1.4/32
# ip ospf area 0

# # bgp config
# router bgp 1
# neighbor 1.1.1.1 remote-as 1
# neighbor 1.1.1.1 update-source lo
