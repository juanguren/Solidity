// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// Send and receive ether
contract Liquidity {

    address public contractOwner;
    uint public maxAmmount = 0.5 ether;

    event Received(uint value);
    event Retrieved(uint value);

    modifier onlyOwner() {
        require(msg.sender == contractOwner, "User is not the owner");
        _;
    }

    modifier ammountCap() {
        require(msg.value <= maxAmmount, "Invalid ammount");
        _;
    }

    constructor() {
        contractOwner = msg.sender;
    }

    function send() external payable ammountCap {
        emit Received(msg.value);
    }

    function retrieve() public payable onlyOwner ammountCap {
        (bool success, ) = contractOwner.call{value: msg.value}("");
        require(success, "Not accepted");

        emit Retrieved(msg.value);
    }
}