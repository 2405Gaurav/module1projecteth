
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    uint256 public storedValue;
    address public owner;

    constructor() {
        owner = msg.sender; 
    }

    function storeValue(uint256 _value) public {
        require(_value > 0, "Value must be greater than zero");
        storedValue = _value;
    }


    function checkStoredValue() public view returns (string memory) {
        assert(storedValue != 0 && storedValue <= 1000);
        return "stored value is in range";
    }

    function onlyOwnerCanCall() public view {
        if (msg.sender != owner) {
            revert("Only the owner can call this function");
        }
    }

  
}