// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract CoinFlip {

    using SafeMath for uint256;
    uint256 public consecutiveWins;
    uint256 lastHash;
    // it's actually 2^255
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    // Setup the counter to 0
    constructor() public {
      consecutiveWins = 0;
    }


    // give a bool, get bool back
    function flip(bool _guess) public returns (bool) {
      // block.number: the curr block nr
      // blockhash(): hash of the given block — only for 256 most recent blocks
      // look @ the nr of the prev block, get hash & cast to uint256
      uint256 blockValue = uint256(blockhash(block.number.sub(1)));


      // check for multiple txs  on the same block  
      // and let through only the first one
      if (lastHash == blockValue) {
        // undo all state changes, but handled 
        // differently than an `invalid opcode`
        //   - allows youo to return value
        //   - or refund remaining gas to caller
        revert();
      }
      // set the lastHash based on blockValue
      // ! it's entirely dependent on the block tx is included on
      lastHash = blockValue;
      
      // btw: 3 / 4 = 0 in solidity
      // so we should get only 1 or 0
      uint256 coinFlip = blockValue.div(FACTOR);
      bool side = coinFlip == 1 ? true : false;

      // compare pseudo random flip result with
      // user's guess & adjust wins accordingly
      if (side == _guess) {
        consecutiveWins++;
        return true;
      } else {
        consecutiveWins = 0;
        return false;
      }
    }
}
