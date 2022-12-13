
# Root permission.


```
sudo su
cd
```


# Update your server and get the necessary libraries.

```
sudo apt update && sudo apt upgrade -y
```
```
sudo apt install pkg-config curl git build-essential libssl-dev -y
```
```
sudo apt install docker.io -y
```


# Install screen.

```
sudo apt install screen -y
```

# Install binaries.
get latest release
```shell
curl -s https://api.github.com/repos/eqlabs/pathfinder/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'
```

install binaries from lastest release above command:
```shell
```sh
git clone --branch <latest> https://github.com/eqlabs/pathfinder.git
```
