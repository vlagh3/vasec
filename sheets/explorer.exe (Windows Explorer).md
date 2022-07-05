---
tags: ⚡
---

# `explorer.exe` (Windows Explorer)

- gives the user access to their folders and files
- provides functionality to other features such as the Start Menu, Taskbar, etc.
- has many child processes

### normal
- Image Path: `%SystemRoot%\explorer.exe`
- Parent Proc: creaated by `userinit.exe` & exists
- Nr of Insstances: 1 or more per interactively logged-in user
- Usser Acc: Logged-in user(s)
- Start Time: 1st insstance when the 1st interactive logon sesh begins

### suspicious
- an actual parent process. *(`userinit.exe` calls this process and exits)*
- image file path other than `C:\Windows`
- running as an unknown user
- subtle misspellings to hide rogue process in plain sight
- outbound TCP/IP connections


---

## References
[[Core Windows Processes - THM]]

## See Also
[[Windows]]
