---
tags: 🗞️
url: https://apisecurity.io/encyclopedia/content/owasp/api4-lack-of-resources-and-rate-limiting
topic: [[Web-Sec]]
---

# A4: Lack of Resources & Rate Limiting
## Description
> Quite often, APIs do not impose any restrictions on the size or number of resources that can be requested by the client/user. Not only can this impact the API server performance, leading to Denial of Service (DoS), but also leaves the door open to authentication flaws such as brute force.

This one is pretty self-explanatory, if you don't limit your API's usage and don't impose restrictions on how many requests/resources users with different privileges can make, then attackers can build scripts to abuse that 
*(e.g brute-forcing, denial of service)*

### Is my API vulnerable ?
API requests consume resources such as network bandwidth, CPU, memory and storage. The amount of resources required to satisfy a request depends on the user input and endpoint business logic. If at least one of the following limits are missing or set poorly *(e.g too high/low)*, your API might be vulnerable:
- execution timeouts
- max allocable memory
- nr of file descriptors/procs
- payload size *(e.g file uploads)*
- nr of req per client/resource
- nr of records per page to return in a single request response

## Use Case Scenarios
### Scenario 1
We have an app which contains the user's list on a UI with a limit of `200` users per page. This is retrieved by a back-end endpoint at `/api/users?page=1&size=100`. An attacker changes the `size` parameter to `200 000` causing performance issues on the DB. Meanwhile the API becomes unresponsive and is unable to handle further requests, causing a DoS.
The same scenario might be used to provoke Integer Overflow or Buffer Overflow errors, which can be pretty dangerous.

### Scenario 2
[2FA Bypass via Logical Rate Limiting Bypass](https://medium.com/@jeppe.b.weikop/2fa-bypass-via-logical-rate-limiting-bypass-25ae2a4e1835). In this app, the user would be redirected to a 2FA security check page after logging in. If you tried to brute-force that, it would lock you out after 10 incorrect attempts, however it allowed the user unlock their account via an *Unlock Account* link where you were asked to provide an email address where the reset link would be sent.

Now, after some additional research, you would discover that there was no rate limiting on the login page is the submitted credentials were valid and that the *Unlock Account* links could be requested by an account that wasn't locked. Thus, an attacker could brute-force the 2FA authentication code by:
1. Sending an *Unlock Account* request email
2. Submit a valid victim credentials and attempt to guess the 2FA code 10 times
3. Unlock the account by accessing the *Unlock Account* link received in 1
4. Repeat until the code was found

### Scenario 3
An attacker uploads a large image by issuing a POST request to `/api/v1/images`. When the upload is complete, the API creates multiple thumbnails with different sizes. Due to the size of the uploaded image, available memory is exhausted during the creation of thumbnails and the API becomes unresponsive.

## Mitigation
- Define proper rate limiting. For example, docker makes it easy to limit memory, cpu, nr of restarts, file descriptors and much more
- Limit the amount of requests a client can make to the API within a defined timeframe
- Add proper server-side validation for the query string and the request body, specifically on the one's that control the nr of records returned
- Add checks on compression ratios
- Tailor the rate limiting to be match what API methods, clients, or addresses need or should be allowed to get
- Review and implement have a rate limiting policy for any endpoints which may pose a threat *(e.g keep an eye out for: login, reset passwd, 2FA/OTP, Sign up, sending msgs, pin code, forums, comments)*
- Check parsers on recursion vulnerabilities
---
## References
[NordVPN No Rate Limit On Forgot Password Page Of NordVPN -- hackerone](https://hackerone.com/reports/751604)
[2FA Bypass via Logical Rate Limiting Bypass](https://medium.com/@jeppe.b.weikop/2fa-bypass-via-logical-rate-limiting-bypass-25ae2a4e1835)
[Bypass Rate Limit like a PRO](https://infosecwriteups.com/bypassing-rate-limit-like-a-pro-5f3e40250d3c)
[Blocking Brute Force Attacks](https://owasp.org/www-community/controls/Blocking_Brute_Force_Attacks)
[CWE-307 Improper Restriction of Excessive Authentication Attempts](https://cwe.mitre.org/data/definitions/307.html)
[python - API Security and Rate Limiting](https://www.youtube.com/watch?v=A4Cwc_zSnRg)
[Kubernets API Server JSON/YAML parsing vulnerable to resource exhaustion attack](https://github.com/kubernetes/kubernetes/issues/83253)

## See Also
[[Web-Sec]]