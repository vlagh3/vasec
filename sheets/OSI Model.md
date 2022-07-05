---
tags: ⚡
---

# OSI Model

The OSI *(**O**pen **S**ystems **I**nterconnection)* Model is a standardised model which we use to demonstrate the theory behind computer networking
> NOTE: in practice, it's actually the more compact TCP/IP model that real-world networking is based off

![[Pasted image 20220530125204.png]]


- **Layer 1: Physical**: Transmission and reception of raw bit streams over a physical medium
	- is right down to the hardware of the computer
	- where electrical pulses that, make up data, transfer over the network *(i.e it converts the digital bits into electrical, radio, or optical signals)*
	- also specifies how encoding occurs over a physical signal, such as electrical voltage or a light pulse
- **Layer 2: Data Link**: Focuses on the _physical_ addressing of the transmission
	- eceives a packet from the network layer *(includes the IP addr)* & adds in the physical address *([[MAC]])* of the receiving endpoint
	- it presents the data in a format suitable for transmission
	- serves an important role when it receives data, as it checks to make sure that it hasn't been corrupted during transmission *(which could happen in layer 1)*
- **Layer 3: Network**: Structuring and managing a multi-node network, including addressing, routing and traffic control
	- the internet is a huge network, so when you request info from a webpage, it's the network layer that takes the IP addr & figures out the best route to take
	- this is referred as Logical addressing *(i.e IP addr)* which are all software controlled
	- logical addresses are used to provide order to networks, categorising them and allowing us to properly sort them
- **Layer 4: Transport**: Reliable transmission of data segments between points on a network, including segmentation, acknowledgement and multiplexing
	- can be connection-oriented *(TCP: **T**ransmission **C**ontrol **P**rotocol)* 
		- connection between the computers is established and maintained for the duration of the request
		- allows for a reliable transmission, as the connection can be used to ensure that the packets _all_ get to the right place *(data is sent at an acceptable rate & any lost data is re-sent)*
		- usually be chosen for situations where accuracy is favoured over speed *(e.g file transfer, loading a webpage)*
	- OR connectionless *(UDP: **U**ser **D**atagram **P**rotocol)*
		- the opposite is true: packets of data are essentially thrown at the receiving computer
		- if it can't keep up then that's _its_ problem
		- would be used in situations where speed is more important *(e.g video streaming)*
	- the transport layer then divides the transmission up into bite-sized pieces, which makes it easier to transmit the msg successfully
- **Layer 5: Session**: Managing communication sessions *(i.e continuous exchange of information in the form of multiple back-and-forth transmissions between two nodes)*
	- it looks to see if it can set up a connection with the other computer across the network
		- if it can't, an error gets thrown & exits
		- if a session _can_ be established then it's the job of the session layer to maintain it, as well as co-operate with the session layer of the remote computer in order to synchronise communications
	- allows you to make multiple requests to different endpoints simultaneously without all the data getting mixed up *(e.g opening 2 tabs @ the asme time)*
	- when it has successfully logged a connection between the host and remote computer the data is passed down to Layer 4
- **Layer 6: Presentation**: Translation of data between a networking service and an application; including character encoding, data compression and encryption/decryption
	- receives data from the application layer
	- tends to be in a format that the application understands, but not necessarily in a standardised format that could be understood by the application layer in the _receiving_ computer
	- so it translates the data into a standardised format & then passes it down to the session layer
- **Layer 6: Application**: High-level APIs, including resource sharing, remote file access
	- closest to the end user
	- works almost exclusively with applications, providing an interface for them to use in order to transmit data
	- functions typically include file sharing, message handling, and database access, through the most common protocols at the application layer, known as HTTP, FTP, SMB/CIFS, TFTP, and SMTP

## Encapsulation
As the data is passed down each layer of the model, more information containing details specific to the layer in question is added on to the start of the transmission
![[Pasted image 20220531140101.png]]
When the message is received by the second computer, it reverses the process -- starting at the physical layer and working up until it reaches the application layer, stripping off the added information as it goes. This is referred to as _de-encapsulation_

> Think of the layers of the OSI model as existing inside every computer with network capabilities. Whilst it's not actually as clear cut in practice, computers all follow the same process of encapsulation to send data and de-encapsulation upon receiving it

The process of encapsulation & de-encapsulation give us a standardised methodology for sending & receiving data. Thus, allowing any network enabled device to communicate with any other reachable device and be sure that it will be understood *(regardlesss of whether they are from the same manufacturer, using the same OS or not)*

## References
[Wiki](https://en.wikipedia.org/wiki/OSI_model)

## See Also
[[TCP/IP Model]]
[[Networking]] | [[SysAdmin]]