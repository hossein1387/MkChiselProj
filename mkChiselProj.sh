#!/bin/bash
#Defining color variables:
CSTART='\e[0;32m'
Green='\033[0;32m'
Red='\033[0;31m'      
CEND='\033[0m'
# Default values:
PROJ_NAME="chisel_proj"
BASE_URL="https://github.com/hossein1387/BaseChiselProj.git"

# Utility functions are here:
function show_help()
{
  IT=$(CAT << EOF
  usage: ./mkChiselProj.sh CHISEL_PROJECT_NAME
         It will create a default chisel project under CHISEL_PROJECT_NAME
         directory. 
  )
  echo "$IT"
}

# Read input args and clone git repo:
if [ "$1" == "help" ]; then
	show_help
	exit 1
fi

if [ "$1" != "" ]; then
	PROJ_NAME="$1"
else
	echo -e "${Red}Cloning $BASE_URL to a default project name...${CEND}"
fi

if [ -d "$PROJ_NAME" ]; then
	echo -e "${Red}$PROJ_NAME directory already exist! try to create this project in different directory. ${CEND}"	
	exit 1
fi

echo -e "Cloning ${Green}$BASE_URL${CEND} repository in ${Green}$PROJ_NAME${CEND} directory..."
git clone "$BASE_URL" "$PROJ_NAME"
cd "$PROJ_NAME"
rm -rf .git 
git init

echo "done!"
