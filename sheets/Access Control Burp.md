---
tags: ⚡
---

# Acess Control Burp


## Testing

### Unprotected functionality *(once you find the correct path you're in)*
- briefly skim through HTML source code for *"obfuscated"* administrative functions 
	- which might be generated from a js script
		```html
		// for example:
		<script>  
			var isAdmin = false;  
			if (isAdmin) {  
			 ...  
			 var adminPanelTag = document.createElement('a');  
			 adminPanelTag.setAttribute('https://insecure-website.com/administrator-panel-yb556');  
			 adminPanelTag.innerText = 'Admin panel';  
			 ...  
			}  
		</script>
		```
- check for `robots.txt` for disclosed sensitive pages
### Parameter-based AC methods
- does the app determine user priviliges / role @ login?
	- e.g `https://insecure-website.com/login/home.jsp?admin=true or ?role=1` 
	- if so, what happens when you change it?
- is there any `role/admin` parameter after login, in other functionalities?
	- e.g [when updating your mail](https://portswigger.net/web-security/access-control/lab-user-role-can-be-modified-in-user-profile)/password 
### Broken AC from platform misconfig
- Is it [URL-based](https://portswigger.net/web-security/access-control/lab-url-based-access-control-can-be-circumvented)?
	- apps might configure rules like the following: `DENY: POST, /admin/deleteUser, managers`
	- Is the back-end framework supporting additional headers? *(e.g `X-Original-URL/X-Rewrite-URL` )*
		- if so, you can rewrite the URL with a req like this:
			```
			POST / HTTP/1.1  
			X-Original-URL: /admin/deleteUser  
			...
			```
	- More about [URL rewrite vulns](https://www.acunetix.com/vulnerabilities/web/url-rewrite-vulnerability/)
- What about [method-based](https://portswigger.net/web-security/access-control/lab-method-based-access-control-can-be-circumvented)
	- try to change the types of HTTP req methods *(e.g `PUT`, `DELETE`, `HEAD`)* 
	- does it employ the same level of access control / verification
		- change session between users w diff roles
		
### Horizontal privesc
- can you see info of other users if you change the `?id` param?
- if app uses [GUID]()s, are there any leakeages when other users are referenced *(e.g comments, profile pages)*
- does the app detects when a user i not permitted to access a resource?
	- then where and how does it react?
		- e.g [leakeage in redirect](https://portswigger.net/web-security/access-control/lab-user-id-controlled-by-request-parameter-with-data-leakage-in-redirect)
- if you can access resources that you shouldn't be able to
	- is there any important data to access another acc & further your privs? *(e.g [password disclosure in reset pass](https://portswigger.net/web-security/access-control/lab-user-id-controlled-by-request-parameter-with-password-disclosure))*
- check [[IDOR]] as well

### Broken Logic in Multi-Step Processes
- Some apps might implement important functions over a series of steps 
	- often happens when multiple inputs/options need to be captured
	- or when the uer needs to review/confirm details before an action is performed
- For example, an adminisrtative function to update a user might include the following steps
	1. Load form containing options for the specified user
	2. Submit changes
	3. Review them & confirm
- Whenever you observe such behavior, test if access controls are implemented throughout all of the steps
	- sometimes an app [might ignore to validate control in crucial steps](https://portswigger.net/web-security/access-control/lab-multi-step-process-with-no-access-control-on-one-step)
		1. `POST /admin-roles (upgrade/downgrade)`  with the `userename=carlos&action=upgrade` params
		2. `GET /admin (no take me back`
		3. `POST /admin-roles (yes, change roles` with the additional `confirmed=true` param
	- in this example, the 3rd step is ignored => an atacker can elevate its priviliges by changing the `username` param

### Referer-based AC
- Test if the app is basing its access control on the `Referer` header submitted
	- header generally added to indicate the page from which a req was initialized
- In some cases you can easily bypass the access control on administrative functionalities by manipulating this header
	- e.g [change your role to admin](https://portswigger.net/web-security/access-control/lab-referer-based-access-control)


## Prevention
Access control vulnerabilities can generally be prevented by taking a defense-in-depth approach and applying the following principles:
-   Never rely on obfuscation alone for access control.
-   Unless a resource is intended to be publicly accessible, deny access by default.
-   Wherever possible, use a single application-wide mechanism for enforcing access controls.
-   At the code level, make it mandatory for developers to declare the access that is allowed for each resource, and deny access by default.
-   Thoroughly audit and test access controls to ensure they are working as designed.

## References
[Access control security models briefly desscribed](https://portswigger.net/web-security/access-control/security-models)

## See Also
[[Web-Sec]]

---