---
tags: ⚡
---

# `lsass.exe` (Local Security Authority Subsystem Service)
> "Local Security Authority Subsystem Service (**LSASS**) is a process in Microsoft Windows operating systems that is responsible for enforcing the security policy on the system. It verifies users logging on to a Windows computer or server, handles password changes, and creates access tokens. It also writes to the Windows Security Log."

- creates security tokens for 
	- SAM *(Security Account Manager)*
	- AD *(Active Directory)*
	- NETLOGON
- uses auth pkgs specified in: `HKLM\System\CurrentControlSet\Control\Lsa`
- also targeted by adversaries since it manages authentication
	- common tools such as `mimikats` is used to dump credentials or they mimic this proc to hide in plain sight
	- [How LSASS is maliciously used and additional features that Microsoft has put into place to prevent these attacks](https://yungchou.wordpress.com/2016/03/14/an-introduction-of-windows-10-credential-guard/)

### normal
- Image Path: `%SystemRoot%\System32\lsass.exe`
- Parent Proc: `wininit.exe`
- Nr of Instances: 1
- User Acc: `Local System`
- Start Time: secss of boot time

### suspicious
- a parent process other than `wininit.exe`
- Image file path other than `C:\Windows\System32`
- Subtle misspellings to hide rogue process in plain sight
- Multiple running instances
- Not running as SYSTEM



---

## References
[[Core Windows Processes - THM]]

## See Also
[[wininit.exe (Windows Initialization Process)]]
[[Windows]]
