#!/bin/sh
version="1.0"
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
DARK='\033[1;30m'
NC='\033[0m'

echo "${BLUE}Wallet713 binary installer ${version}${NC}"
unameOut="$(uname -s)"
case "${unameOut}" in
    Darwin*)    arch=osx;;
    *)          arch=amd64
esac
url=$(curl -s https://api.github.com/repos/vault713/wallet713/releases/latest | grep "browser_download_url.*${arch}.tgz\"" | cut -d : -f 2,3 | tr -d '\"[:space:]')

echo "${DARK}"
echo "Configuration: [${arch}]"
echo "Location:      [${url}]"
echo "Directory:     [/usr/local/bin]"
echo "${NC}"

curl -J -L ${url} | tar xz -C /usr/local/bin

if [ $? -eq 0 ]
then
  echo "${GREEN}"
  echo "Installation completed successfully."
  echo "$ wallet713 --version"
  /usr/local/bin/wallet713 --version
else
  echo "${RED}"
  echo "Failed installing wallet713"
fi

echo "${NC}"
