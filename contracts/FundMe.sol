// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract FundMe {
    
    mapping(address => uint256) public AddressBalMap;
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    function addFund() public payable{
        AddressBalMap[msg.sender] = msg.value;
    }
    
    modifier onlyOwner{
        require(msg.sender == owner, "You don't have access");
        _;
    }
    
    function checkDeposit() public view returns(uint256){
        return address(this).balance;
    }
    
    function withdraw() onlyOwner public payable{
        // msg.sender.transfer(address(this).balance);
        payable(owner).transfer(address(this).balance);
    }
}