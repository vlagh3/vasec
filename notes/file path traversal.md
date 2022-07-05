---
tag: ⚡
topic: [[Web-Sec]]
---

# File path traversal


---

## Tips & Tricks
- traversal sequences stripped non-recursevly
	- use `....//` or `....\/`
- if server strips any directory traversal seqs
	- try URL encoding *(or even double URL encoding)* the `../` chars
	- `%2e%2e%2f` or `%252e%252e%252f`
	- or various non-standard encodings: `..%c0%af` or `..%ef%bc%8f`
- app expects for user-supplied filename to start with base folder *(e.g `/var/ww/img`)*
	- include traversal seq after base folder: `/var/www/imgs/../../../etc/passwd`
- parameter needs to end with an expected file extension *(e.g `.png`*) ? 
	- then try using a null byte to terminte the file path before the required extension: `param=../../../etc/passwd%00.png` 


## Prevention
Avoid passing user-supplied input to filesystem APIs altogether

If that's not possible consider these layers of defense:
- Validate user input before processing. Ideally, the validation should compare against a whitelist of permitted values
	- If that's not possible, then verify that the input contains only permitted content *(e.g purely alphanumeric chars)*
- After validation, the app should append the input to the base directory & use a platform filesytem API to canonicalize the path *(verify that the path starts with the expected base dir)*

A  simple snippet of  Java code to do just that:
```java
File file = new File(BASE_DIRECTORY, userInput);  
if (file.getCanonicalPath().startsWith(BASE_DIRECTORY)) {  
 // process file  
}
```

---

## References

## See Also
[[Web-Sec]]

