// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Beacon contract
contract Beacon {
    address public implemenation;

    function updateImplementation(address newImplementation) external {
        implementation = newImplementation;
    }
}

// Proxy contract
contract BeaconProxy {
    address public beacon;
    constructor(address _beacon) {
        beacon = _beacon;
    }

    fallback() external payable {
        
        address implementation = Beacon(beacon).implementation();
        (bool success, ) = implementation.delegatecall(msg.data);
        require(success. "call failed");
     }

}