---
tags: 🥷
topic: THM
url: https://tryhackme.com/room/btwindowsinternals
---

# Core Windows Processes - THM
## TaskManager
- add columns by right-click on column headers
- `details`
	- good columns to add: `Image path name` & `command line`
	- if the Image path name or Command line is not what it's expected to be, then we can perform a deeper analysis on this process
- lacks certain important information when analyzing processes, such as **parent process information**
- where other utilities, such as [Process Hacker](https://processhacker.sourceforge.io/) and [Process Explorer](https://docs.microsoft.com/en-us/sysinternals/downloads/process-explorer) come to the rescue
- cmd-line equivalents: `tasklist`, `Get-Process` or `ps` *(PowerShell)*, and `wmic`

## System
> "_The System process (process ID 4) is the home for a special kind of thread that runs only in kernel mode a kernel-mode system thread. System threads have all the attributes and contexts of regular user-mode threads (such as a hardware context, priority, and so on) but are different in that they run only in kernel-mode executing code loaded in system space, whether that is in Ntoskrnl.exe or in any other loaded device driver. In addition, system threads don't have a user process address space and hence must allocate any dynamic storage from operating system memory heaps, such as a paged or nonpaged pool._"

### Unusual behavior 4 this process
- A parent process (aside from System Idle Process (0))
- Multiple instances of System. (Should only be 1 instance) 
- A different PID. (Remember that the PID will always be PID 4)
- Not running in Session 0

## Core Procs
- [[smss.exe (Session Manager Subsystem)]]
- [[csrss.exe (Client erver Runtime Proc)]]
- [[wininit.exe (Windows Initialization Process)]]
- [[services.exe (Service Control Manager)]]
- [[svchost.exe (Service Host)]]
- [[lsass.exe (Local Security Authority Subsystem Service)]]
- [[winlogon.exe (Windows Logon)]]
- [[explorer.exe (Windows Explorer)]]


---

## References
- [User mode VS Kernel mode](https://docs.microsoft.com/en-us/windows-hardware/drivers/gettingstarted/user-mode-and-kernel-mode)
- [https://www.threathunting.se/tag/windows-process/](https://www.threathunting.se/tag/windows-process/)[](https://www.threathunting.se/tag/windows-process/)
- [https://www.sans.org/security-resources/posters/hunt-evil/165/download](https://www.sans.org/security-resources/posters/hunt-evil/165/download)[](https://www.sans.org/security-resources/posters/hunt-evil/165/download)
- [https://docs.microsoft.com/en-us/sysinternals/resources/windows-internals](https://docs.microsoft.com/en-us/sysinternals/resources/windows-internals)

## See Also
[[Sysinternals - THM]]
[[SecOps]]
[[THM]]
