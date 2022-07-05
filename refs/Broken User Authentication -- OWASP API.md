---
tags: 🗞️
url: https://apisecurity.io/encyclopedia/content/owasp/api2-broken-authenticatio
topic: [[Web-Sec]]
---

# A2: Broken User Authentication

## Description
> Authentication mechanisms are often implemented incorrectly, allowing attackers to compromise authentication tokens or to exploit implementation flaws to assume other user’s identities temporarily or permanently. Compromising a system’s ability to identify the client/user, compromises API security overall.

There are 2 main issues:
1. *Lack of protection mechanisms*:
 APIs endpoints that are responsible for authentication should be treated differently from regular endpoints and implement extra layers of protection
	- Permits [[credential stuffing]] and any form of brute-force without having any captcha/account lockout mechanism
	- Improper encryption on passwords/highly sensitive files, or even worse, no encryption at all
	- Lack of access token validation `(including JWT validation)`
	- No rate limit for requests
2. *Misimplementation of the mechanism*
	The mechanism is used / implemented without considering the attack vectors, or it’s the wrong use case.
	- Poor implementation of [[JWT tokens]], allowing the attacker to exploit [known vulnerabilities](https://auth0.com/blog/critical-vulnerabilities-in-json-web-token-libraries/#Great--So--What-s-Wrong-with-That-)
	- Sends sensitive authentication details, such as tokens/passwords, unencrypted/in a poorly manner over the 'wire' *(e.g URLs)*
	- Broken [OAuth 2](https://oauth.net/2/) implementation or trying to write your own authentication system that mimics already public software, because what could go wrong ?

## Use Case Scenarios
### Scenario 1
An attacker starts the password recovery workflow by issuing a `POST` req to `/api/system/verification-codes` and by providing the username in the req body. Next, a SMS token with 6 digits is sent to the victim's phone. Because the API doesn't implement any kind of rate limiting policy/system, the attacker is able to test all possible combinations using a multi-threaded script, against the `/api/system/verification-codes/{smsToken}` endpoint to discover the right token within a few minutes.

### Scenario 2
Actually a real-world example from *DX:Exchange* which was a popular trading website which had [problems with their JWT tokens](https://arstechnica.com/information-technology/2019/01/hot-new-trading-site-leaked-oodles-of-user-data-including-login-tokens/) that allowed an attacker to access other user's tokens and therefore leak sensitive information.
The main issues were:
- Non expiring unsigned access tokens
- JWT tokens leaking other user's tokens

### Scenario 3
This is another real-world example, but more out of the ordinary since it includes IOT, more specifically, [Hot tubs](https://www.pentestpartners.com/security-blog/hackers-in-hot-water-pwning-smart-hot-tubs-yes-really/). The Balboa hot tubs had a way to remotely control your device through a mobile app which used an API without proper authentication. This allowed attackers to use WiFi hotspot directories to locate all Balboa hot tubs around the world and remotely control them. The sad part is that the manufacturer is not responding or fixing the product, so go ahead, play around with that.
The main issues were:
- The APIs were 'protected' with a shared hard-coded password within the mobile app, which could be easily retrieved
- The mobile app controlling the hot tub is invoking the hot tub's API over the Internet
- Each hot tub comes with an unprotected WiFi hotspot
- The APIs used the WiFi hotpot ID as the device identifier


## Mitigation
- Make sure you know all the possible flows to authenticate to the API 
*(mobile/ web/deep links that implement one-click authentication/etc.)*
- Read about your authentication mechanisms. Make sure you understand what and how they are used. OAuth is not authentication, and neither is API keys.
- Follow the [best practices](https://blog.asayer.io/jwt-authentication-best-practices) around using and developing with JWT Tokens
- Check the [OWASP Auth Cheathseet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)
- Where possible, implement multi-factor authentication.
- Don't reinvent the wheel in authentication, token generation, password storage or cryptography. Use the standards, and if you really want to contribute, build upon those standards and make it public. That's what open source is all about after all.
- Implement anti brute-force mechanisms to mitigate credential stuffing, dictionary attacks and any kind of brute-force attack which might pose a threat to your authentication mechanisms. This should be stricter than the regular rate limiting mechanism of your API
- Credential recovery/forget password endpoints should be treated as login endpoints in terms of brute force, rate limiting, and lockout protections.
- Implement account lockout / captcha mechanism to prevent brute force against specific users. Implement weak-password checks. 
- API keys should not be used for user authentication, but for client [app/project authentication](https://cloud.google.com/endpoints/docs/openapi/when-why-api-key)
- Check all possible ways to authenticate to all APIs.

---

## References
[DevCentral YT vid on OWASP Top 10: Broken Authentication](https://www.youtube.com/watch?v=mruO75ONWy8&list=PLyqga7AXMtPPuibxp1N0TdyDrKwP9H_jD&index=3)
[Session Management Cheatsheet OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html)

## See Also
[[Web-Sec]]