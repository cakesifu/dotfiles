#!/bin/bash

TARGET=$1
PACKAGE=${2:='misc'}
PACKAGE_DIR="${HOME}/dotfiles/${PACKAGE}"

mkdir -p $PACKAGE_DIR

cp $TARGET $PACKAGE_DIR
rm -rf $TARGET

cd $HOME/dotfiles
stow -t $HOME $PACKAGE
