---
tags: ⚡
---

# `svchost.exe` (Service Host)

- responsible for hosting and managing Windows services
- services are implemented as DLLs
	- the DLL to implement is stored in the regisstry for the service under the `Parameters` subkey in `ServiceDLL`
	- full path: `HKLM\SYSTEM\CurrentControlSet\Services\SERVICE NAME\Parameters`
	- ![[Pasted image 20220609184419.png]]
- look for this info in Process Hacker
	- right-click the `svchosts.exe` proc: `Services > DcomLaunch > Go to Service`
		- ![[Pasted image 20220609184640.png]]
	- right-click the service & select `Properties`
		- ![[Pasted image 20220609184650.png]]
	- notice the `-k` parameter which is used to group similar services to share the same process *(done in order to reduce resource consumption)*. 
- since `svchost.exe` will always have multiple running procs it has been of high interest for malicious uses
	- adversaries create malware masquerading as this proc to try to hide amongst the legitimate `svchosts.exe` procs *(name the malware `svchost.exe` or misspell it slightly: `scvhost.exe`)*
	- another tactic is to install/call a malicious service *(i.e DLL)*
	- [nice article about the topic](https://www.hexacorn.com/blog/2015/12/18/the-typographical-and-homomorphic-abuse-of-svchost-exe-and-other-popular-file-names/)
- more about it [here](https://en.wikipedia.org/wiki/Svchost.exe)

### normal
- Image Path: `%SystemRoot%\System32\svchost.exe`
- Parent Proc: `services.exe`
- Nr of Instances: many
- User Acc: Varies *(SYSTEM, Network Service, Local Service)* depending on the `svchost.exe` instance. In Windows 10 some instances can run as the logged-in user
- Start Time: typically within secs of boot time *(other instances might be sstarted after boot)*

### suspicious
- a parent process other than `services.exe`
- Image file path other than `C:\Windows\System32`
- Subtle misspellings to hide rogue process in plain sight
- The absence of the `-k` parameter


---

## References
[[Core Windows Processes - THM]]

## See Also
[[services.exe (Service Control Manager)]]
[[Windows]]
