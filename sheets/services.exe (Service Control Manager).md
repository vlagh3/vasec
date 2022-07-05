---
tags: ⚡
---

# `services.exe` (Service Control Manager)
- spawned by `wininit.exe`
- primary responsibility is to handle system services: loading services, interacting with services, starting/ending services, etc
- maintains a db, accesible through the `sc.exe` cmd
- info regarding services is stored in `HKLM\System\CurrentControlSet\Services`
- also loads device drivers marked as auto-start into memory
- when user logs into a machine, this proc is responsible for setting the value of the `Last Known Good` control set, in `HKLM\System\Select\LastKnownGood`, to that of the `CurrentControlSet`
- is the parent of severaal other key procs *(e.g `svchost.exe`, `spoolsv.exe`, `msmpeng.exe`, `dllhost.exe`)*
- more [here](https://en.wikipedia.org/wiki/Service_Control_Manager)

### normal
- Image Path: `%SystemRoot%\System32\services.exe`
- Parent Proc: `wininit.exe`
- Nr of Instances: 1
- User Acc: `Local System`
- Start Time: within secs of boot time

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
