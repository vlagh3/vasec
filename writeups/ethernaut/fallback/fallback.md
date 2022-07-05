---
tags: 🥷
url: https://ethernaut.openzeppelin.com/level/0x9CB391dbcD447E645D6Cb55dE6ca23164130D008
---

# 1. Fallback
![](writeups/ethernaut/fallback/contract.png)

## What is a fallback function?
-   [Special functions solidity](https://docs.soliditylang.org/en/latest/contracts.html#special-functions)
-   `receive()` function Solidity
-   enables a smart contract’s inherent ability to act like a wallet, this way other contracts/wallets can send Ether to the contract without having to know the `ABI` or specific function names
-   without a fallback, or known payable functions, smart contracts can only receive Ether
-   how to trigger the fallback functions
	-   calling a function that doesn't exist
	-   calling a function without passing the required data
	-   sending Ether without any data to the contract
-   a contract's fallback is always nameless

## Dissecting The Contract
-   the contract `owner` will be assigned to whomever creates the contract: `constructor() { owner = msg.sender }`
-   `modifier onlyOwner` used to ensure that only the `owner` can execute some functions _(e.g `withdraw`)_
-   `withdraw` will transfer the entire balance of the contract to its owner
-   upon creation _(in `constructor()`)_ the owner is assigned a total of `1000` ether: `contributions[msg.sender] = 1000 * (1 ether)`
-   `contribute()`
-   we can make a contribution by
-   finally the fallback: `receive()`

## Takeaways
-   when implementing a fallback function, keep it simple
-   use fallback functions to:
    -   emit payment events to the tx log
    -   check simple conditional requirements
-   think twice before using fallback functions, especially if you plan to change the contract's ownership, transfer funds or support low-level function callso

## Refs
- [What is an ABI?](https://www.quicknode.com/guides/solidity/what-is-an-abi)
- [Sending Ether](https://solidity-by-example.org/sending-ether/)
- [Write-up](https://www.pauric.blog/How-To-Hack-Ethereum-Contracts-The-Easy-Way/)

## See Also
[[Ethernaut Wargame]]
[[Blockchain]]