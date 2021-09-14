# Deployment Address

> Library Contract: 0xa1364d81d86e88cfD018CCa4ac239A997dc96F31

# Overview
Below is a brief description of the three modules. All will be kept up-to-date with new rarity core releases.

## Library
> rarity_library.sol

Offers functions to fetch aggregated data for summoners and items. Can be used by other smart contracts or UIs. 
For example to load all summoner data for multiple summoners: 
```
>>> library.summoners_full([466576, 466591])

((('Conan', 750000000000000000000, 1631556199, 1, 2), ((18, 14, 14, 10, 10, 8), (4, 2, 2, 0, 0, -1), 32, 32, True), ((0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), (Fals
e, False, False, True, False, True, False, False, False, False, False, False, False, True, False, False, True, True, False, True, False, False, False, False, True, False, False, False, False, False, False, True, True, False, False,
False), 20, 0), (0, 1000000000000000000000, 0), ((40, 8),)), (('Wulfgar', 750000000000000000000, 1631556199, 1, 2), ((18, 14, 14, 10, 10, 8), (4, 2, 2, 0, 0, -1), 32, 32, True), ((0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), (False, False, False, True, False, True, False, False, False, False, False, False, False, True, False, False, True, True, False, True, False, False, False, False, True, False,
 False, False, False, False, False, True, True, False, False, False), 20, 0), (0, 1000000000000000000000, 0), ((40, 8),)))
```
In addition to summoner information, crafted items can also be queried by address. 

See [rarity_structs](contracts/rarity_structs.sol) for an explanation of the data types.

## Interfaces 
> rarity_interfaces.sol
> 
> IERC721.sol

Includes the most relevant interfaces for all rarity core contracts, including ERC721.

## Structs
> rarity_structs.sol

Holds all the structs that are used in the library contract. 
Import this into your smart contract to have access to the library functionality.


# Tests
> [https://github.com/rarity-adventure/rarity-integration/tree/main/tests](https://github.com/rarity-adventure/rarity-integration/tree/main/tests).

