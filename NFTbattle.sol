
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTbattle is ERC721{

    struct Ninja{
        string name;
        uint level;
        string img;
    }

    Ninja[] public ninjas;
    address public gameOwner;

    constructor () ERC721 ("NarutoBattle", "NRT"){
        gameOwner = msg.sender;
    }

    modifier onlyOwnerOf(uint _ninjaId){
        require(ownerOf(_ninjaId) == msg.sender, "Apenas o dono pode batalhar");
       _;
    }

    function battle(uint _attackingNinja, uint _defendingNinja) public onlyOwnerOf(_attackingNinja){
        Ninja storage attacker = ninjas[_attackingNinja];
        Ninja storage defender = ninjas[_defendingNinja];

        if(attacker.level >= defender.level){
            attacker.level += 3;
            defender.level += 2;
        }else{
            attacker.level += 2;
            defender.level += 3;
        }


    }


    function createNewNinja(string memory _name, address _to, string memory _img) public {
        require(msg.sender == gameOwner, "Apenas o dono do jogo pode criar Ninjas");
        uint id = ninjas.length;
        ninjas.push(Ninja(_name, 1, _img));
        _safeMint(_to, id);
    }




}
