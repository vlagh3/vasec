---
tags: 🌐
topic:: [[Web-Sec]]
---

# OWASP API Sec Top 10

---
1. [[Broken Object Level Authorization]]
2. [[Broken User Authentication -- OWASP API]]
3. [[Excessive Data Exposure -- OWASP API]]
4. [[Lack of Resources & Rate Limiting -- OWASP API]]
5. Broken Function Level Authorization
6. Mass Assignment
7. Security Misconfiguration
8. API Injection
9. Improper Assets Management
10. Insufficient Logging & Monitoring

## Meta

**Traditional Apps**
```bash
user --> client-browser --GET-> Server --> DB
						<-HTML-
```
						
**Modern Apps**
```bash
user --> client-browser --API-GET-> Server --> DB
						<---RAW---- Microservices 
										|- db1
										|- db2
```

---

## References
[OWASP API SEc Top 10 Webinar](https://www.youtube.com/watch?v=zTkv_9ChVPY)
[APISecurity.io](https://apisecurity.io/)
[Common API Security Pitfalls - Philippe De Ryck](https://www.youtube.com/watch?v=hlEzlS6WN4k)

## See Also
[[Web-Sec]]