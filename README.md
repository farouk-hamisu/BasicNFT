# BasicNFT

BasicNFT is a simple smart contract built using OpenZeppelin's ERC721 standard. It allows users to mint their own NFTs easily.

## Features

- **ERC721 Implementation:** Utilizes OpenZeppelin's implementation for secure and standard functionality.
- **Minting:** Users can mint unique NFTs directly from the smart contract.
- **Metadata Support:** Each NFT can have unique metadata associated with it.

## How to Use

### Prerequisites

- Install [Foundry](https://getfoundry.sh/) for smart contract development.
- Have a supported Ethereum wallet (e.g., MetaMask).
- Access to an Ethereum testnet like Sepolia.

### Setup

1. Clone this repository:
   ```bash
   git clone <repository_url>
   cd <repository_name>

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/DeployBasicNFT.sol --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
