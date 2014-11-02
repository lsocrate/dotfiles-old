#!/bin/bash
# setup-dotfiles
#
# Author: yamadapc <github.com/yamadapc> 2013
# Simple shell script to create the necessary symlinks to my home folder, from
# the dotfiles folder - nothing intelligent going on here

LINKED_FILES=("tmux.conf" "vimrc" "zshrc" "gitconfig")

function main() {
  for i in ${LINKED_FILES[@]} ; do
    ln -s "$HOME/dotfiles/$i" "$HOME/.$i"
  done
  setup_vim
  setup_zsh
}

function setup_vim() {
  mkdir $HOME/.vim
  mkdir $HOME/.vim/backup
  mkdir $HOME/.vim/tmp
  mkdir $HOME/.vim/bundle
  mkdir $HOME/.vim/undo
  cd $HOME/.vim/bundle
  git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
}

function setup_zsh() {
  git clone http://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
}

main

