# Starknet-Node
Starknet Full Node


# 1) Before installing node, get your endpoint from Alchemy.

read [alchemy](./alchemy.md)

# 2) Install the node.

## 2a) Scripted installation

``` 
wget -O starknet.sh https://raw.githubusercontent.com/bxdoan/Starknet-Node/main/starknet.sh && chmod +x starknet.sh && ./starknet.sh
```

## 2b) Manual installation

You can also install the node [manually](https://github.com/bxdoan/Starknet-Node/blob/main/Starknet_manual.md) to improve your Node knowledge.

# 3) Continue.

## Open a screen.

```
screen -S starknet
```

## Start your node.

```
mkdir -p $HOME/pathfinder
docker run \
  --rm \
  -p 9545:9545 \
  --user "$(id -u):$(id -g)" \
  -e RUST_LOG=info \
  -e PATHFINDER_ETHEREUM_API_URL="<HTTPS URL FROM ALCHEMY>" \
  -v $HOME/pathfinder:/usr/share/pathfinder/data \
  eqlabs/pathfinder
```

Here is a sample command.

```
mkdir -p $HOME/pathfinder
docker run \
  --rm \
  -p 9545:9545 \
  --user "$(id -u):$(id -g)" \
  -e RUST_LOG=info \
  -e PATHFINDER_ETHEREUM_API_URL="https://eth-mainnet.g.alchemy.com/v2/COsy1IzxkLxxxkRyxxxIpxwJxxxx" \
  -v $HOME/pathfinder:/usr/share/pathfinder/data \
  eqlabs/pathfinder
```

# Your node is syncing

![image](https://user-images.githubusercontent.com/101462877/204108544-bdf4ab06-18cb-4246-bec8-2f17909d8691.png)


