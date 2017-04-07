# Dotfiles

## Setting up a new machine

Prerequisites, make sure you have `stow` and `git` already installed.

```bash
$ pacman -Sy stow git
$ git clone git@github.com:cezar-berea/dotfiles.git ~/dotfiles
$ ~/dotfiles/install.sh [options]
```

## Importing new files

```bash
$ import.sh <file to import> <package>
```
