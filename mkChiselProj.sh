#!/bin/bash

# Exit if error exist
set -eu

#Defining color variables:
CSTART='\e[0;32m'
Green='\033[0;32m'
Red='\033[0;31m'      
CEND='\033[0m'
# Default values:
PROJ_NAME="chisel_proj"
BASE_URL="https://github.com/hossein1387/BaseChiselProj.git"
PROJ_DIR=`pwd`
PROJ_PATH=""
IDEA_DIR=""

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
if [[ "$#" -eq 0 ]]; then
	echo -e "${Red}Cloning $BASE_URL to a default project name...${CEND}"
elif [[ "$1" == "help" ]] 
then
	show_help
	exit 1
else
	PROJ_NAME="$1"
fi


if [[ -d "$PROJ_NAME" ]]; then
	echo -e "${Red}$PROJ_NAME directory already exist! try to create this project in different directory. ${CEND}"	
	exit 1
fi

echo -e "Cloning ${Green}$BASE_URL${CEND} repository in ${Green}$PROJ_NAME${CEND} directory..."
git clone "$BASE_URL" "$PROJ_NAME"
cd "$PROJ_NAME"
rm -rf .git 

# Rename idea project
PROJ_PATH=$PROJ_DIR/$PROJ_NAME
IDEA_DIR=$PROJ_PATH/.idea
sed -i "s/SimpleReg/${PROJ_NAME}/g" $IDEA_DIR/workspace.xml
cd $PROJ_PATH/src/test/scala/
mv SimpleRegUnitTest.scala ${PROJ_NAME}UnitTest.scala 
sed -i "s/SimpleReg/${PROJ_NAME}/g" *.scala
cd $PROJ_PATH/src/main/scala/
mv SimpleReg.scala ${PROJ_NAME}.scala 
sed -i "s/SimpleReg/${PROJ_NAME}/g" *.scala

# init git repo and add all files
cd $PROJ_PATH
git init
git add *

echo "done!"
