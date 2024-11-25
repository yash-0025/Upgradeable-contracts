// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract UUPSImplementation {
    address pubic owner;

    constructor(){
        owner = msg.sender;
    }

    function upgradeTo(address newImplementation) external {
        require(msg.sender == owner, "You are not the onwer");
        (bool success,) = newImplementation.delegatecall(abi.encoeWithSignature("upgradeTo(address)", newImplementation))
        require(success, "Address not changed.")
    }

    function logicFunction() external pure returns (string memory) {
        return "New functions ";
    }
}