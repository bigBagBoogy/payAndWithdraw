// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Maarten {
    // connect  --> (JS with ethers)  --> pay  -->   getBalance (JS with ethers) --> withdraw
    error Maarten__NotOwner();

    uint256 public constant MINIMUM_VALUE = 0.0025 ether;
    address payable private immutable i_owner;

    modifier onlyOwner() {
        // require(msg.sender == i_owner);
        if (msg.sender != i_owner) revert Maarten__NotOwner();
        _;
    }

    constructor() {
        i_owner = payable(msg.sender);
    }

    function pay() public payable {
        require(msg.value >= MINIMUM_VALUE, "Amount is wrong");
        payable(msg.sender).transfer(msg.value);
    }

    function withdraw() public onlyOwner {
        uint256 contractBalance = address(this).balance;
        i_owner.transfer(contractBalance);
    }
}
