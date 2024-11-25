// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Diamond Storage
library DiamondStorage{
    struct Storage {
        mapping(bytes4 => address) facets;
    }

    function getStorage() internal pure returns (Storage storage ds) {
        bytes32 position = keccak256("diamond.storage");
        assembly {
            ds.slot := position
        }
    }
}

// Proxy contract
contract Diamond {
    fallback() external payable {
        DiamondStorage.Storage storage ds = DiamondStorage.getStorage();
        address facet = ds.facet[msg.sig];
        require(facet != address(0), "Function does not exist");

        (bool success,) = facet.delegatecall(msg.data);
        require(success, "Call failed");
     }

     function addFacet(bytes4 selector, address facet) external {
        DiamondStorage.Storage storage ds = DiamondStorage.getStorage();
        ds.facets[selector] = facet;
     }
}