---
tags: ⚡
---

# `smss.exe` (Session Manager Subsystem)
- also known as the **Windows Session Manager**, is responsible for creating new sessions. This is the first user-mode process started by the kernel
- it starts the kernel mode & user mode of the Windows subsystem *(more on [NT Architecure](https://en.wikipedia.org/wiki/Architecture_of_Windows_NT))*. Includes: 
	- `win32k.sys` *(kernel mode)*
	- `winrv.dll` *(user mode)*
	- `csrss.exe` *(user mode)*
- `smss.exe`: the first child intance creates child instances in new seshs by copying itself in the new sessions & self-terminating *(more [here](https://en.wikipedia.org/wiki/Session_Manager_Subsystem))*
	- -> `crss.exe` *(Win ssubsysstem)* & `wininit.exe` in Session 0 *(isolated win sesh for the OS)*
	- -> `csrss.exe` & `winlogon.exe` for Session 1 *(user sesh)*
- any other subsystem listed in the `Required` value of `HKLM\System\CurrentControlSet\Control\Session Manager\Subsystems` is also launched
- also responsible for creating environment variables, virtual memory paging files and starts `winlogon.exe` *(the Windows Logon Manager)*

## normal
- Image Path: `%SystemRoot%\System32\smss.exe`
- Parent Process: `System`
- Nr of Instances: 1 master instance & child instance per sesh *(the child exists after creation)*
- User Acc: `Local System`
- Start Time: within secs of boot time for the master instance

## suspicious
- a different parent process other than System(4)
- Image path is different from `C:\Windows\System32`
- More than 1 running process. *(children self-terminate and exit after each new session)*
- User is not `SYSTEM`
- Unexpected registry entries for Subsystem

---

## References
[[Core Windows Processes - THM]]

## See Also
[[Windows]]
