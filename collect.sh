#!/bin/sh
cd ~
brew bundle dump --force
cp Brewfile dotfiles/Brewfile
cp .zshrc dotfiles/zshrc
cp powerlevel9k.config dotfiles/powerlevel9k.config
cp .vimrc dotfiles/vimrc
cp .gvimrc dotfiles/gvimrc
cp .tmux.conf dotfiles/tmux.conf
cp -R .config/nvim dotfiles/
cd dotfiles
git add .
git commit -v
