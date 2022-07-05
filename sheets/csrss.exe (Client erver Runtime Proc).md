---
tags: ⚡
---

# `csrss.exe` (Client erver Runtime Proc)
- user-mode side of the Windows subsystem
- always running and is critical to system operation
	- if terminated it will result in system failure
	- responsible for the Win32 console window and process thread creation and deletion
	- for each instance `csrsrv.dll`, `basesrv.dll`, and `winsrv.dll` are loaded *(along w others)*
- also responsible for making the Windows API available to other processes, mapping drive letters, and handling the Windows shutdown process
- more [here](https://en.wikipedia.org/wiki/Client/Server_Runtime_Subsystem)

### normal
- Image Path: `%SystemRoot%\System32\csrss.exe`
- Parent Process: created by an instance of `smss.exe`
- Nr of Instances: 2 or more
- User Account: `Local System`
- Start Time: within seconds of boot time for the first 2 instances *(for Session 0 and 1)*.  Start times for additional instances occur as new sessions are created, although often only Sessions 0 and 1 are created.

### suspicious
- an actual parent process. *(`smss.exe` calls this process and self-terminates)*
- Image file path other than `C:\Windows\System32`
- Subtle misspellings to hide rogue process masquerading as `csrss.exe` in plain sight
- User is not SYSTEM

---

## References
[[Core Windows Processes - THM]]

## See Also
[[Windows]]
