---
tags: ⚡
---

# AD -- Sites
- a site is the physical location of your network infrastructure, such as a [[Local Area Network (LAN)]]
- in [[AD -- Domain Controllers (DC)|AD DS]], a site object represents represents aspects of the physical site that can be managed, specifically, replication of directory data between domain controllers
- are typically used by sys-admins to
	- create new sites
	- [delegate control]() over sites using [Group Policy](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831791(v=ws.11)) & permissions
- @ each site there is an [NTDS Site Settings object](https://docs.microsoft.com/en-us/windows/win32/adschema/c-ntdsservice) that identifies the Intersite Topology Designer *(ISTG)*
	- the ISTG is the domain controller in the site that generates the connection objects for domain controllers in different sites and performs advanced replication management functions


---

## References
[Understanding AD Site Topology](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/understanding-active-directory-site-topology)
[Designing the site topology](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/designing-the-site-topology)

## See Also
[[Windows]] | [[Active Directory]]
