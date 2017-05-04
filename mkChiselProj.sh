#!/bin/bash
#Defining color variables:
CSTART='\e[0;32m'
Green='\033[0;32m'
Red='\033[0;31m'      
CEND='\033[0m'
# Read input args and clone git repo:
PROJ_NAME="chisel_proj"
BASE_URL="https://github.com/hossein1387/BaseChiselProj.git"
if [ "$1" != "" ]; then
	PROJ_NAME="$1"
else
	echo -e "${Red}Cloning $BASE_URL to a default project name...${CEND}"
fi

echo -e "Cloning ${Green}$BASE_URL${CEND} repository in ${Green}$PROJ_NAME${CEND} directory..."
#git clone "$BASE_URL" "$PROJ_NAME"
#cd "$PROJ_NAME"
#rm -rf .git 


