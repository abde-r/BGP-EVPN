hostname VTEP_aelasri-1
no ipv6 forwarding
!
interface eth0
 ip address 10.1.1.1/30
!
interface eth1
 ip address 10.1.1.5/30
!
interface eth2
 ip address 10.1.1.9/30
!
interface lo
 ip address 1.1.1.1/32
!
router bgp 1
 neighbor ibgp peer-group
 neighbor ibgp remote-as 1
 neighbor ibgp update-source lo
 bgp listen range 1.1.1.0/29 peer-group ibgp
 !
 address-family l2vpn evpn
  neighbor ibpg activate
  neighbor ibpg route-reflector-client
 exit-address-family
!
router ospf
!

#

# vtysh

# hostname VTEP_aelasri-1

# # ospf configuration for IP reachability in network
# router ospf
# network 1.1.1.2/32 area 0
# network 10.1.1.0/24 area 0

# # loopback & physical interfaces configuration
# interface lo
# ip address 1.1.1.1/32

# interface eth1
# ip address 10.1.1.1/30

# interface eth2
# ip address 10.1.1.2/30

# interface eth3
# ip address 10.1.1.3/30

# # bgp configuration
# router bgp 65000
# bgp router-id 1.1.1.1
# neighbor LEAF_PEER peer-group
# neighbor LEAF_PEER remote-as 65000
# neighbor LEAF_PEER update-source lo
# neighbor 1.1.1.2 peer-group LEAF_PEER
# neighbor 1.1.1.3 peer-group LEAF_PEER
# neighbor 1.1.1.4 peer-group LEAF_PEER

# # l2vpn configuration for EVPN routes distribution
# address-family l2vpn evpn
# neighbor LEAF_PEER activate
# neighbor LEAF_PEER route-reflector-client
# exit-address-family
