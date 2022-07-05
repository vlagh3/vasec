---
tags: ⚡
---

# `winlogon.exe` (Windows Logon)

- launched by `smss.exe`
- responsible for handling the **Secure Attention Sequence** (SAS)
	- the `ALT+CTRL+DELETE` key combination users press to enter their username & password
- loads the user profile: by loading the user's `NTUSER.DAT` into HKCU and via `userinit.exe` to load the shell
- locks the creen & runs the user's screensaver
- more about it [here](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc939862(v=technet.10)?redirectedfrom=MSDN)

### normal
- Image Path: `%SystemRoot%\System32\winlogon.exe`
- Parent Proc: created by an instance of `smss.exe` that exists *(analysis tools don't provide the parent's proc name)*
- Nr of Insstances: 1 or more
- Usser Acc: `Local System`
- Start Time: within secs of boot time 4 the 1st instance *(sesh 1)*. Additional insstances occur as new seshs are created *(i.e RDP or Fast User Switching logons)*

### suspicious
- an actual parent process. *(`smss.exe` calls this process and self-terminates)*
- Image file path other than `C:\Windows\System32`
- Subtle misspellings to hide rogue process in plain sight
- Not running as SYSTEM
- Shell value in the registry other than explorer.exe


---

## References
[[Core Windows Processes - THM]]

## See Also
[[smss.exe (Session Manager Subsystem)]]

[[Windows]]
