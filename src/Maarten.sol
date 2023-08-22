// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract Maarten {
    // connect  --> JS with ethers
    // pay
    // getBalance
    // withdraw

    address private immutable i_owner;

    modifier onlyOwner() {
        // require(msg.sender == i_owner);
        if (msg.sender != i_owner) revert Maarten__NotOwner();
        _;
    }

    constructor() {
        i_owner = msg.sender;
    }
}
