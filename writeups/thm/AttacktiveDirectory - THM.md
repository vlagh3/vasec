---
tags: 🥷
topic: THM
url: https://tryhackme.com/room/attacktivedirectory
---

# AttacktiveDirectory - THM
## Recon
- `nmap -sC -sV -oA nmap/scan 10.10.99.248`
	- ![[Pasted image 20220616211102.png]]
- [kerbrute](https://github.com/ropnop/kerbrute) for kerberos user enumeration *(we're provided w 2 lists: [users.txt]() & [pass.txt]())*
	- ![[Pasted image 20220616211359.png]]

- ![[Pasted image 20220616213440.png]]
- or from [here](https://hashcat.net/wiki/doku.php?id=example_hashes) &n searching for `domain` => `Kerberos 5, etype 23, AS-REP`
- ![[Pasted image 20220616213836.png]]
- ![[Pasted image 20220616215145.png]]


---

## References
[room](https://tryhackme.com/room/attacktivedirectory)
[HackTricks - ASREPRoast](https://book.hacktricks.xyz/windows-hardening/active-directory-methodology/asreproast)
[Enumerating AD infrastructure](https://medium.com/@Shorty420/enumerating-ad-98e0821c4c78)



## See Also
[[Windows]]
[[THM]]
