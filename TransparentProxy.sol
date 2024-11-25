// Proxy contract
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract TransparentProxy {
    address public owner;
    address public implementation;

    constructor(address _implementation) {
        owner = msg.sender;
        implementation = _implementation;
    }

    fallback() external payable {
        require(msg.sender != owner, "Owner cannot call fallback");
        (bool success, ) = implementation.delegatecall(msg.data);
        require(success, "Call Failed");
    }

    function upgradeTo(address newImplementation) external {
        require(msg.sender = owner, "You are not the owner");
        implementation = newImplementation;
    }
}