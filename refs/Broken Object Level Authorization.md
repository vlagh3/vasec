---
tags: 🗞️
url: https://apisecurity.io/encyclopedia/content/owasp/api1-broken-object-level-authorization.htm
topic: [[Web-Sec]]
---

# A1 Broken object level authorization <sub>*IDORs*</sub>

![idor diag](https://apisecurity.io/encyclopedia/images/owasp/api1.jpg)

## Description
If an attacker is able to manipulate one object's ID that's sent within a request, and retrieve a resource belonging to another user, then you found an Insecure Direct Object Reference (IDOR). This usually happens due to a lack of proper authorization checks in the back-end system.

This issue is extremely common in API-based apps because the server relies more on parameters *(like object IDs)* retrieved from the client to decide which objects to access.

Or in the words of the bible ([OWASP]()):
> Insecure Direct Object References occur when an application provides direct access to objects based on user-supplied input. As a result of this vulnerability attackers can bypass authorization and access resources in the system directly, for example database records or files.

## Use Case Scenarios
**Scenario 1**
While monitoring someone's network traffic, you observe a `HTTP PATCH` request which has the following header: `X-User-Id: 54796`. By incrementing the value of that header to `54797` and sending the request, you receive a valid HTTP response. Thus, being able to modify other user's account data

**Scenario 2**
Imagine a chat web application within an organization. At some point, let's say after 2 years, they decide to make the app public. However, one of the old api's endpoint, which was used for development, is still open at `/api/v1/user_msg`. This will respond with the user's messages based on an ID parameter that's sent by the client within a `POST` request.

If an attacker finds this old development endpoint and does some simple reconnaissance to understand the environment better, he can determine that the user object's ID is incremental. If we assume that the admin user is with `id: 1`, the attacker can easily retrieve that user's private messages by sending a `POST` request with an id parameter of 1:
```bash
curl -X POST "https://ape.corp/api/v1/user_msg" -d "{'user_id': 1}"
```
In fact, he can access every user's messages.

**Scenario 3**
An e-commerce platform for online stores (shops) provides a listing page with the revenue charts for their hosted shops. Inspecting the browser requests, an attacker can identify the API endpoints used as a data source for those charts and their pattern `/shops/{shopName}/revenue_data.json`. Using another API endpoint, the attacker can get the list of all hosted shop names. With a simple script to manipulate the names in the list, replacing `{shopName}` in the URL, the attacker gains access to the sales data of thousands of ecommerce stores


## Mitigation
> Every API endpoint that receives an ID of an object, and performs any type of action on the object, should implement object level authorization checks. The checks should validate that the logged-in user does have access to perform the requested action on the requested object.
- Implement a proper authorization mechanism that relies on the user policies and hierarchy.
- Do not rely on IDs that the client sends. Use IDs stored in the session object instead.
- Use random and unpredictable IDs that cannot/are hard to be guessed (UUIDs)
- Write tests to evaluate the authorization mechanism. Do not deploy vulnerable changes that break the tests

---

## References
[T-Mobile API Breach (2017)](https://www.youtube.com/watch?v=3_gd3a077RU)
[PortSwigger Lab](https://portswigger.net/web-security/access-control/idor)
[API Sec Top 10 Pdf](https://github.com/OWASP/API-Security/raw/master/2019/en/dist/owasp-api-security-top-10.pdf)
[Fuzzing API to identify IDORs -- 2020 Apidays Hong Kong](https://www.youtube.com/watch?v=sQFpHOiq6ck)

## See Also
[[Web-Sec]]