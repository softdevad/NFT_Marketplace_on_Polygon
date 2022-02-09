// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// URIStorage, gives us an additional function called "SetToken URI" that allows us to set the Token URI.
import "@openzeppelin/contracts/utils/Counters.sol";
// Counters, is an easy-to-use utility for incrementing #s.

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress; // The address of the Marketplace we want to allow the NFT to be able to interact with.
    // EXAMPLE: We want to give the NFT market the ability to transact tokens or change the ownership of the tokens 
    // from a separate contract.  We do this with function, "Set approval for all"

    constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
        contractAddress = marketplaceAddress;
    }

    function createToken(string memory tokenURI) public returns (uint) {
        // This function creates new tokens.
        _tokenIds.increment();  // Increments starting at 0 with each new mint
        uint256 newItemId = _tokenIds.current(); // Will get the current value of the Token Ids.

        _mint(msg.sender, newItemId); // Mints a new token.  "msg.sender" is the createor, "newItemId" is the ID of the token.
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true); // Gives the marketplace the approval to transact the Token between Users from wtihin another contract.
        return newItemId; // Used for front-end UX.
    }
}