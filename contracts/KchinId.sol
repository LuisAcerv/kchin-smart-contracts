pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

//@dev: Token Interface
contract ERC20 { //@dev: This doesn't have to match the real contract name. Call it what you like.
   function balanceOf(address) returns(uint); //@dev: No implementation, just the function signature. This is just so Solidity can work out how to call it.
}

contract KchinId is ERC721Token, Ownable{

  address public owner = msg.sender;//@dev: Owner
  ERC20 erc20;//@dev: set de ERC20 variable
  function KchinId(address _address) ERC721Token("KchinId", "KID") public {    
    erc20 = ERC20(_address);
  }


  struct ID{
    bytes data;
    uint nonce;
  }

  ID[] public ids;

  function getIdCount() public constant returns (uint idCount) {
    return ids.length;
  }

  function getId(uint _user_id) public view returns(bytes data, uint nonce){
    ID memory _id = ids[_user_id];
    data  = _id.data;
    nonce = _id.nonce;
  }

  function mint(address _beneficiary, bytes _data, string _uri, uint _nonce) public payable onlyOwner{
    uint256 weiAmount = msg.value;//2000000000000000 Wei = 0.002 ETH

    ID memory _id = ID({data:_data, nonce: _nonce });
    uint _Id = ids.push(_id) - 1;
    _mint(_beneficiary, _Id);

    _setTokenURI(_Id, _uri);
  }
}
