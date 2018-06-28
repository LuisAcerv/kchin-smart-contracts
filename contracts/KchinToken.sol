pragma solidity 0.4.19;

import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';


contract KchinToken is MintableToken {
    string public name = "Kchin Token";
    string public symbol = "KCT";
    uint8 public decimals = 18;
}
