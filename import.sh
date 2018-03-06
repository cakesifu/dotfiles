#!/bin/bash

help_message() {
  echo "Usage: import.sh <target file> <package>"
}

if [ $# -lt 2 ]; then
  help_message
  exit 1
fi

TARGET=$1
PACKAGE=${2:='misc'}
PACKAGE_DIR="${HOME}/dotfiles/${PACKAGE}"

mkdir -p $PACKAGE_DIR

cp -r $TARGET $PACKAGE_DIR
rm -rf $TARGET

cd $HOME/dotfiles
stow -v -t $HOME $PACKAGE
