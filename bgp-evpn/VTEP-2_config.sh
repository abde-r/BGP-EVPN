ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up
brctl addif br0 vxlan10
brctl addif br0 eth1

hostname VTEP_aelasri-2
no ipv6 forwarding
!
interface eth0
 ip address 10.1.1.2/30
 ip ospf area 0
!
interface lo
 ip address 1.1.1.2/32
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

# ip link add vxlan10 type vxlan id 10
# ip link set up dev vxlan10

# vtysh


# hostname VTEP_aelasri-2

# # eth0 interface config
# interface eth0
# ip address 10.1.1.2/30
# ip ospf area 0

# # loopback interface config
# interface lo
# ip address 1.1.1.2/32
# ip ospf area 0

# # vxlan config
# interface vxlan10
# vxlan source-interface lo
# vxlan vni 5000

# # bgp config
# router bgp 1
# neighbor 1.1.1.1 remote-as 1
# neighbor 1.1.1.1 update-source lo
