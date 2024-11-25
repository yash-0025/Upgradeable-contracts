// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Storage contract
contract EternalStorage {
    mapping(bytes32 => uint256) public uintStorage;

    function setUint(bytes32 key, uint256 value) external {
        uintStorage[key] = value;
    }
}

// Logic contract
contract EternalLogic {
    address public storageContract;

    constructor(address _storageContract) {
        storageContract = _storageContract;
    }

    function setValue(bytes32 key, uint256 value) external {
        EternalStorage(storageContract).setUint(key,value);
    }
}