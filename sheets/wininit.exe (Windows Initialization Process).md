---
tags: ⚡
---

# `wininit.exe` (Windows Initialization Process)

responsible for launching:
- `services.exe` *(Service Control Manager)*
- `lsass.exe` *(Local Security Authority)*
- `lsaiso.exe` within Session 0


> NOTE: `lsaiso.exe` is a process associated with **Credential Guard and Key Guard**. You will only see this process if Credential Guard is enabled

### normal
- Image Path: `%SystemRoot%\System32\wininit.exe`
- Parent Proc: created by `smss.exe`
- Nr of Instances: 1
- User Acc: `Local System`
- Start Time: within secs of boot time

### suspicious
- An actual parent process. *(`smss.exe` calls this process and self-terminates)*
- Image file path other than `C:\Windows\System32`
- Subtle misspellings to hide rogue process in plain sight
- Multiple running instances
- Not running as SYSTEM

---

## References
[[Core Windows Processes - THM]]

## See Also
[[Windows]]
