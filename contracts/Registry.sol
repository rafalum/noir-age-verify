pragma solidity 0.8.20;

import { UltraVerifier } from "circuits/contract/plonk_vk.sol";

contract Registry {

    address public _owner;
    address public _registrar;

    UltraVerifier public immutable _verifier;

    constructor(address verifierAddress, address registrar) {

        _verifier = UltraVerifier(verifierAddress);
        _registrar = registrar;
        _owner = msg.sender;
    }


    function set(bytes calldata proof, bytes32[] calldata inputs) public {
        require(this.verify(proof, inputs));
        last = uint256(inputs[2]);
        emit Banana(uint256(inputs[0]), uint256(inputs[1]), uint256(inputs[2]));
    }

}