pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";


contract TradaNFT is ERC721 {
    using Strings for uint256;
    string public baseURI = "https://raw.githubusercontent.com/trada96/base_erc721_nft/master/images/";
    
    constructor() ERC71("Trada NFT", "ICETEANFT"){}

     function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json"))
        : "";
    }

    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }
}