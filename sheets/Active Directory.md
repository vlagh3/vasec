---
tags: ⚡
---

# Active Directory

## What is active directory?
- It’s what Windows uses to control Windows’ own networks, everything in AD is objects
- A directory is nothing more than a db containing info about organization's users *(e.g name, login, passsword, title, profile)*
- It centralizes everything iniside the network *(a heaven for sys-admins)*
- ![[Pasted image 20220618175819.png]]
- Some of it's features are: *(for more see the [official doc](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/ad-ds-getting-started) & [here](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc782657(v=ws.10)))*
	- centralized authentication
	- controlled security level
	- facilitates delegation of administrative tasks
	- makes access management efficient
	- provides an index of resources on the network
	- subdivision of domains into loogical units
	- has data replication capabilities
	- DNS-based naming system unification
	- facilitates the assignment & maintenance of multiple domains
	- facilitates the implementation of usage policie *(Group Policies)*

## How it works?

From a **user's perspective**: whenever someone logs in in the local network environment *(@ OS boot-up)* he's given acess to the available resources on the network. On logon, the AD checks if the info provided by the user is valid & performs authentication.

If we look from a **technical perspective**: 
- the relevant info typically tored in AD include: user contact data, printer queue info, dessktop/network config data
- the active [directory data store](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc736627(v=ws.10)) contains all directory information *(e.g users, groups, computers, domains, organizational units, and security policies)*. It allows full and controlled access management
- directories are used to manage software packages, files, and end-user accounts within organizations
- the administrator uses various [AD concepts](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc780336(v=ws.10)) *(e.g [domains & forests](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc780307(v=ws.10)))* to make changes throughout the whole organization without the need to visit desktops individually


## AD infrastructure

The **logical structure** is divided in order to facilitate the management of objects / account records 4 network resources within the organization:
- [[AD -- Objects]]
- [[AD -- Organizational Units (OU)]]
- [[AD -- Domains, Trees & Forests]]

The **physical structure** is responsible for optimizing network traffic, maintaining security in physical locations, and providing resources that are utilized in a logical perspective & it consists of:
- [[AD -- Domain Controllers (DC)]]
- [[AD -- Sites]]



---

## References
[Active Directory - Intro](https://0x4rt3mis.github.io/posts/Active-Directory-Introdution/)
[Deploying AD](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc778179(v=ws.10))

## See Also
[[Windows]]

