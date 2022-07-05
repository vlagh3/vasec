---
tags: ⚡
---

# [Streams](https://docs.microsoft.com/en-us/sysinternals/downloads/streams)

> "The NTFS file system provides applications the ability to create alternate data streams of information. By default, all data is stored in a file's main unnamed data stream, but by using the syntax `file:stream`, you are able to read and write to alternates."

- [[Alternate Data Streams (ADS)]] is a file attribute specific to Windows [[New Technology File System (NTFS)]]
	- every file has @ least 1 data stream *(`$DATA`)* & ADS allowss files to contain more than one stream of data
	- nativeely Windows Explorer doesn't display ADS to the user => to view it usse 3rd party executables or Powershell
- Malware writers have used ADS to hide data in an endpoint
- When you download a file from the Internet unto an endpoint, there are identifiers written to ADS to identify that it was downloaded from the Internet
	- ![[Pasted image 20220611160518.png]]



---

## References
[[Sysinternals - THM]]

## See Also
[[SysInternals]] | [[Windows]]
