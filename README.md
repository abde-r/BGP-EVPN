<div align="center">

  # BGP-EVPN
<h5>GNS3 with docker images.</h5><br/>
<img src="https://user-images.githubusercontent.com/22397481/166323589-adbf8a5f-acd4-4fa8-90de-89e8acd2a409.jpg" alt="img">  
</div>

---
<a src="https://abder.vercel.app/writings/bgp-evpn"><strong>👉🔗 Full article here:</strong> <ins>https://abder.vercel.app/writings/bgp-evpn</ins></a>
<br/>
<h3>Bird View-Eye</h3>
Ethernet frames are the fundamental data units at the OSI Layer 2, containing source and destination MAC addresses, Payload data (the actual data being transmitted) and Error-checking informations. VXLAN(Data Plane) is designed to transport Layer 2 Ethernet frames across a Layer 3 (IP based) network, enabling devices on different physical networks to behave as if they’re on the same local network.

To transport Ethernet frames across networks that natively don’t support Layer 2, such as an IP-based (Layer 3) network, Encapsulation is the process of wrapping one type of data structure within another (here Layer 2 Ethernet frames to a Layer 4 UDP datagrams).

By transporting Ethernet frames, VXLAN(Control Plane) extends the Layer 2 network, so devices across multiple physical locations can use the same VLAN id or subnet, making them appear as if they’re part of the same local network. As well as preserving Layer 2 functionality by making communication using MAC addresses, VLANs and broadcast domains works seamlessly, even across geographically distributed networks. In short it’s like creating a virtual Layer 2 network over a Layer 3 infrastructure, let’s imagine we’re building private roads (virtual networks) on top of a public highway (the internet or our office network). This allows different companies or groups to share the same highway but still have their own private space.

<br/>

---

<h3>How Does It Work?</h3>
First step is BGP Peering or establishing connections, BGP routers in different AS form a connection called BGP session, these sessions exchange routing information with their peers.

The next step is the Route Advertisement, where BGP routes advertise the networks (prefixes or IP ranges) they can reach, example AS1 advertises it can reach 192.168.0.0/24. AS2 learns this route and advertise it to AS3 and AS3 now know it can reach 192.168.0.0/24 via AS2.

The third step is Path Selection, when a router receives multiple routes to the same destination, BGP selects the best path based on policies such as shortest AS path (fewer hops are preferred), local preference (routes with higher priority within an AS).

Last step is Routing Table Updates, the selected routes are added to the router's routing table, then the router forwards packets based on these routes.

<br/>

---

<h3>Credits</h3>
Many thanks to everyone who has helped building this project.

<br/>
<br/>

<table>
  <tr>
    <td align="center"><a href="https://github.com/abde-r"><img src="https://avatars.githubusercontent.com/u/70513733?v=4" width="100px;" alt=""/><br /><sub><b>@abde-r</b></sub></a></td>
    <td align="center"><a href="https://github.com/khalidsr"><img src="https://avatars.githubusercontent.com/u/85410199?v=4" width="100px;" alt=""/><br /><sub><b>@khalidsr</b></sub></a></td>
    <td align="center"><a href="https://github.com/dependentmadani"><img src="https://avatars.githubusercontent.com/u/47648515?v=4" width="100px;" alt=""/><br /><sub><b>@dependentmadani</b></sub></a></td>
  </tr>
</table>
