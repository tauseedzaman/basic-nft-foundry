// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNtf is ERC721 {
    uint256 private s_tokenCounter;

    mapping(uint256 => string) private s_tokenIdtoUri;

    constructor() ERC721("Dogie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNtf(string memory tokenUri) public {
        s_tokenIdtoUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter += 1;
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override
        returns (string memory)
    {
        return s_tokenIdtoUri[_tokenId];
    }
}
