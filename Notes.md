### Upgradeable contracts in blockchain allows smart contract to be modified after deployment , enabling bug fixes, upgrades and features additions.It is very useful as the blockchain contracts are typically immutable.

**There are different types of Upgradeable contracts**
- **`Proxy Patters`**: Proxies work by separating logic and storage of a contract. A proxy contracts delegates all call to another contract (`implementation contract`) while maintaining storage consistency.
        - **Transparent Proxy Pattern**
        - **UUPS  (Universal Upgradeable Proxy Standard)**
        - **Beacon Proxy Pattern**
        - **Diamond Proxy Pattern(EIP-2535)**

- **`Non-Proxy Patters`**: These approaches dont use a proxy but achieve upgradeability differently.
        - **Self-Destruct and Redeploy**
        - **Eternal storage pattern**

### Transparent Proxy Pattern
- It uses a single proxy contract that delegates calls to an implementation contract.
- Only admin can upgrade the implementation , Regular users interact with the proxy without worrying about the logic .
- It prevents admin from interacting with logic function to avoid accidental overrides.
- Proxy contract hold storage and delegates calls.
- Implementation contracts contains the business logic.

### UUPS (Universal Upgradeable Proxy standard)
- Here the logic contract itself contains the upgradeable functionality.
- A single function in the implemetation contracts handles this upgrades.
- It reduces the gas costs since the upgrade logic inside the implementation contract.


### Beacon Proxy Pattern
- It uses a beacon contract to point to the implementation contract
- Proxy contract fetch the implemetation address from the Beacon, enabling multiple proxies to use the same logic contract.
- It has centralized controlfor upgrading logic across multiple proxies

### Diamond Proxy Pattern [EIP-2535]
- It splits functionality across multiple logic contracts , calls facets.
- It uses a diamond storage pattern to map function selectors to facet.

### Self Destruct and Redeploy
- The contract is destroyed using **`selfdestruct`** and a new contract is redeployed with the same address.
- It cannot retian its storage back as it is wiped out during destruction

## Eternal Storage Pattern
- Separates storage into a standalone contract
- The logic contract can be redeployed and reference the same storage contract.



