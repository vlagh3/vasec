---
tags: ⚡
---

# AD -- Domain Controllers (DC)

![[Pasted image 20220618190513.png]]
- it's a server running AD DS: [Active Directory Domain Services](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/virtual-dc/active-directory-domain-services-overview)
- a DC runs AD & stores the base, as well as replicate this base with other DC's
- AD DS maintains a db of information about network resources & directory-enabled application-specific data *(i.e the AD logical structure data)*
	- contains info about [[AD -- Objects]], usually shared resources *(e.g servers, volumes, printers, and the network user and computer accounts)*
- access management it made possible through the capabilities provided by AD DS through login authentication & access control 
	- admins can manage directory & organizational data acros their entire network
	- network users can use a single login to access resources anywhere on the network, as per settings previously established by administrators


---

## References
[AD DS: Getting Started](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/ad-ds-getting-started)

## See Also
[[Windows]] | [[Active Directory]]

