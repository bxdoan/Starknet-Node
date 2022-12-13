#!/bin/bash
SH=$(cd `dirname $BASH_SOURCE` && pwd)  # get SH=executed script's path
DIRECTORY='pathfinder'
echo -e "\e[1m\e[32m1. Updating server and installing other necessary things.. \e[0m"
echo "======================================================"
sudo apt update && sudo apt upgrade -y
sudo apt install pkg-config curl git build-essential libssl-dev -y
sudo apt install docker.io -y
sudo apt install screen -y

if [ ! $L1URL ]; then
	read -p "Enter your L1 URL: " L1URL
	echo 'export L1URL='$L1URL >> $HOME/.bash_profile
fi

echo -e "\e[1m\e[32m3. Installing binaries.. \e[0m"
echo "======================================================"
latest=$(curl -s https://api.github.com/repos/eqlabs/pathfinder/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
echo -e "\e[1m\e[32m3. Installing latest version $latest \e[0m"
if [[ -d "$SH/$DIRECTORY" ]]; then
    echo "$DIRECTORY exists"
    # shellcheck disable=SC2164
    cd "$SH/$DIRECTORY"
    git fetch
    git checkout $latest
else
    echo "$DIRECTORY does NOT exists"
    git clone --branch $latest https://github.com/eqlabs/pathfinder.git
fi

mkdir -p $HOME/pathfinder
docker run \
  --rm \
  -p 9545:9545 \
  --user "$(id -u):$(id -g)" \
  -e RUST_LOG=info \
  -e PATHFINDER_ETHEREUM_API_URL=$L1URL \
  -v $HOME/pathfinder:/usr/share/pathfinder/data \
  eqlabs/pathfinder
