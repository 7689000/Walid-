pragma solidity ^0.8.1;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract MyEpicNFT is ERC721URIStorage {
  // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and its symbol.
  constructor() ERC721 ("SquareNFT", "SQUARE") {
    console.log("This is my NFT contract. Woah!");
  }

  // A function our user will hit to get their NFT.
  function makeAnEpicNFT() public {
     // Get the current tokenId, this starts at 0.
    uint256 newItemId = _tokenIds.current();

     // Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);

    // Set the NFTs data.
    _setTokenURI(newItemId, " https://jsonkeeper.com/b/Y92Y");
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
     
    address receiverAddress = 0xeF607f7db89b9E3450B80C5C0D280b2299989231;
    address senderAddress = 0x7c0bE6FfDB66b42D51Ca3782A13267769bcAeEb5;
  

    _transfer(senderAddress, receiverAddress, newItemId);

    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();

  }
}
