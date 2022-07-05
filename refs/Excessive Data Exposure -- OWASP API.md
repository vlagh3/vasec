---
tags: 🗞️
url: https://apisecurity.io/encyclopedia/content/owasp/api3-excessive-data-exposure
topic: [[Web-Sec]]
---


# A3: Excessive Data Exposure

## Description
> Looking forward to generic implementations, developers tend to expose all object properties without considering their individual sensitivity, relying on clients to perform the data filtering before displaying it to the user.

Due to the complex chain of development, APIs can expose information in large chunks, which is not used to provide any functionality necessarily. Because the API lets the client to handle filtering, an attacker can call the API and get the full data objects, as they are stored in the internal DB, instead of the 'filtered' data that the UI would parse out. *(information disclosure bugs)*

This category includes also poor:
- implementations of data policies *(e.g classification, data at rest)*
- using known weak/vulnerable ciphers, allowing [[HTTP downgrading attacks]]

**Is my API vulnerable ?**
If your API returns sensitive data to the client by design. This data is usually filtered on the client side before being presented to the user. Therefore, an attacker can easily sniff the traffic and see the sensitive data.


## Use Case Scenarios
### Scenario 1
An IOT-based surveillance system allows administrators to create users with different permissions. An admin created a user account for a new security guard which should only have  access to specific buildings on the site. Once the security guard uses his mobile app, an API call is triggered to `/api/sites/111/cameras` in order to receive data about the cameras and display them on a dashboard. The response contains a list with details about cameras:
```bash
curl https://ape.corp/api/sites/111/cameras

{
    "site_id": "1",
	"cameras": [
		{
			 "id": "10",
			 "live_access_token": "xxxx-bbbb",
			 "building_id": "111"
		 },
		{
			 "id": "20",
			 "live_access_token": "xxxx-cccc",
			 "building_id": "111"
		 },
		{
			 "id": "30",
			 "live_access_token": "xxxx-cccc",
			 "building_id": "222"
		 },
		 ...
	]
}

```
While the client UI shows only the cameras which the security guard needs *(only from `building_id: 111`)*, the actual API response contains a full list of cameras from all the buildings within the site.

### Scenario 2
[Uber mass account takeover bug](https://web.archive.org/web/20201110211307/https://appsecure.security/blog/how-i-could-have-hacked-your-uber-account/). 
Basically, an attacker was able to leak any user UUID *(as long as they knew their target email/phone number)* by sending a `POST` request to the `/p3/fleet-manager/\\\_rpc?rpc=addDriverV2` endpoint, with the body containing the user's phone number `{"nationalPhoneNumber":"99999xxxxx","countryCode":"1"}` or the email `{"email": "xxx@gmail.com"}`
This returned an error containing that user's UUID:
```bash
{
	"status": "failure",
	"data": {
			"code": 1009,
			"msg": "Driver ‘47d063f8–0xx5e-xxxxx-b01a-xxxx’ not found"
	}
}
```

This information disclosure vulnerability was further chained with another endpoint which accepted the UUID as a parameter and responded with that user's private information *(e.g location, access tokens)*:
**Request**
```bash
curl -X POST "https://uber.pwned/marketplace/\_rpc?rpc=getConsentScreenDetails" -d "{“language”:”en”,”userUuid”:”xxxx–776–4xxxx1bd-861a-837xxx604ce”}"

```
**Response**
```json
{
...
"getUser": {
		"mobileToken": 114,
		"location": 0000,
	    "firstname": "john",
	    "lastname": "doe",
			...
 }
...
}
```


## Mitigation
- Never ever trust/ rely on the client to parse/filter information that you consider sensitive
- Review all of your responses, only return what the consumer needs and nothing more. While doing that, also have a look at how you respond on errors
- Avoid using generic methods such as `to_json()`/`to_string()` on massive blocks of data. Instead, cherry-pick specific properties you really need/want to return
- Be smarter about what you collect, do you really need to store this data ? Is yes, why and how? After all if you don't have the data, you can't leak it
- Do you have a data classification system in place ? If not, think about how you can distinguish your public/private/very sensitive data.
- Document your API by implementing a schema-based response validation mechanism as an extra layer of security. As part of this mechanism define and enforce data returned by all API methods, including errors.
- Encrypt your data whenever possible
---
## References
[Exposure of Sensitive Information Due to Incompatible Policies -- CWE-213](https://cwe.mitre.org/data/definitions/213.html)

## See Also
[[Web-Sec]] 