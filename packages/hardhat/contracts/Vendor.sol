pragma solidity >=0.6.0 <0.7.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {

  YourToken yourToken;
  uint256 public constant tokensPerEth = 100;

  event BuyTokens(address, uint256, uint256);
  event SellTokens(address, uint256, uint256);

  constructor(address tokenAddress) public {
    yourToken = YourToken(tokenAddress);
  }

  //ToDo: create a payable buyTokens() function:
  function buyTokens() public payable {
    uint256 tokensAmount = msg.value * tokensPerEth;
    yourToken.transfer(msg.sender, tokensAmount);
    emit BuyTokens(msg.sender, msg.value, tokensAmount);
  }

  //ToDo: create a sellTokens() function:
  function sellTokens(uint256 numTokens) public {
    uint256 ethAmount = numTokens / tokensPerEth;
    yourToken.transferFrom(msg.sender, address(this), numTokens);
    msg.sender.transfer(ethAmount);
    emit SellTokens(msg.sender, ethAmount, numTokens);
  }

  //ToDo: create a withdraw() function that lets the owner, you can 
  //use the Ownable.sol import above:
}
