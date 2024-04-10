//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Initializable} from "@openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

//storage is stored in proxy not in implementation/

// Proxy (Borrowing Functions) => Implementation
// Proxy (num = 0) => Implementations (num = 1)
// proxy -> deploy implementation -> call some "initializer" function

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    // constructor can not be used with proxies
    // @custom:0z-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializerrs();
    }

    function initialize() public initializer {
        __Ownable_init(); //set owner to msg.sender
        __UUPSUpgradeable__init();
    }
    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}
