# NFT-BATTLE---DIO-BINANCE--Blockchain-Developer-with-Solidity

## Objetivo: Criar um jogo de batalhas com NFT
Neste desafio do Bootcamp da DIO e Binance, foi criado um jogo de luta com NFTs, no estilo de turnos*.

1. A principal ferramenta foi o [Remix](https://remix.ethereum.org/)


2. O código base solidity utilizado

```

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

```
2. Após o deploy, o resultado no terminal é

   ![image](https://github.com/user-attachments/assets/7da9d36a-d1bb-4bcb-a1d0-b29bde6b662c)

3. Como foi importado o padrão ERC721 na biblioteca @openzeppelin, algumas propriedades são herdadas

   ![image](https://github.com/user-attachments/assets/a82ff2ef-9aa5-47d6-919a-73bfa6e6fc1b)

   ![image](https://github.com/user-attachments/assets/c1e3a7e6-4c8a-47cf-907d-f0958faa5629)


4. A função para criar um novo ninja foi corretamente implementada

   ![image](https://github.com/user-attachments/assets/283e0e7d-85fc-484b-a6f1-bd381d7121fa)

5. Após a criação dos ninjas nas diferentes carteiras, é possível utilizar a função "battle"

   ![image](https://github.com/user-attachments/assets/4138880a-c6ad-4999-b8d2-dd0f799177b1)


### Conclusão
Um jogo com NFTs é uma maneira divertida de exemplificar as inúmeras possibilidades de criação na blockchain. Atualmente os NFTs tem diversas utilidades, como ingressos, governança, certificados, jogos, RWA... 









*Um jogo em turnos, significa que na primeira rodada o jogador A ataca o jogador B e, após o fim do turno, se alterna a ordem.
