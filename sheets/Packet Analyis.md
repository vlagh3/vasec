---
tags: ⚡
---

# Packet Analyis

- make use of the *Time to live (TTL)* field
	- 3 starting TTLs: 255, 128, 64 *(can get a hint of the type of device used based on that)*
	- every router will decrement the TTL when pkg goes through it => determine the hops between src & dst
	- pkg with the same TTL might reveal patterns => insights *(e.g detect spoofing)*
- how many ports found opened?
	- `(tcp.flags.syn == 1) && (tcp.flags.ack == 1)` OR `tcp.flags == 0x012`
	- can also combine with source: `(tcp.flags == 0x012) & (ip.src == IP)`
- what nmap looks in OS fingerprinting
	- `TTL`
	- Sequence nr *(different TCP stacks will use different starting ranges)*
	- TCP Option *(i.e Maximum segment size)*
- look for low `Window` values / difference in Max segment size & Window
	- e.g init tcp conn & can accept up to `1460` bytes, but the bucket to catch it in is only `1024` bytes
	- `tcp.window_size_value == 1024 and tcp.flags.syn == 1` *(maybe nmap sstealth?)*
- `Statistics > Protocol Hierarchy` & `file > Export Objects > HTTP` can be useful in practical applications like threat hunting to identify discrepancies in packet captures
- decrypt HTTPS by loading an RSA key
	- `Edit > Preferences > Protocols > TLS > RSA key lists`
	- fill in the sections
		- port: `start_tls`
		- host: `your_host` *(e.g 127.0.0.1)*
		- protocol: `http`
		- keyefile: `/rsa/private/key/path`

---

## References
[WIRESHARK for CYBERSECURITY w/ Chris Greer!](https://www.youtube.com/watch?v=jFJMt-y6ZvU)

## See Also
[[Networking]] | [[SecOps]]
