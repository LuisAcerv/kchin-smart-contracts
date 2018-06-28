pragma solidity 0.4.19;

import './KchinToken.sol';
import 'zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol';
import "zeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";
import 'zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol';

contract KchinCrowdsale is TimedCrowdsale, CappedCrowdsale, MintedCrowdsale {
    function KchinCrowdsale
        (
          uint256 _openingTime,
          uint256 _closingTime,
          uint256 _rate,
          address _wallet,
          uint256 _cap,
          MintableToken _token
        )
        public
        Crowdsale(_rate, _wallet, _token)
        CappedCrowdsale(_cap)
        TimedCrowdsale(_openingTime, _closingTime){

        }
}
