// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract ValuesList {
    address public contractOwner;
    uint[] public list;

    constructor() {
        contractOwner = msg.sender;
    }

    modifier manageArrayMaxLength() {
        require(list.length <= 20, "Maximum array size reached");
        _;
    }

    function addNumber(uint value) public manageArrayMaxLength returns (uint) {
        list.push(value);
        return value;
    }

    function getListLength() public view returns (uint) {
        return list.length;
    }

    function isMyNumberHere(uint value) public view returns (bool, uint) {
        for (uint i = 0; i < list.length; i++) {
            if (list[i] == value) return (true, value);
        }
        return (false, 0);
    }

    function getOwner() public view returns (address) {
        return contractOwner;
    }
}