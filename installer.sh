#!/bin/bash

echo ""
echo "My Command Line Installer"
echo ""

vimrc_repo="https://github.com/nupejosh/.vimrc.git"
tmux_repo="https://github.com/nupejosh/.tmux.conf.git"


echo ""
echo "Installing vim config"
echo ""

mkdir -p ~/.vim/backup
git clone vimrc_repo ~/.vim/vimrc
vim +PluginInstall +qall  

echo ""
echo "Installing tmux and config"
echo ""
 
git clone tmux_repo ~/
sudo pacman -S tmux --noconfirm

echo ""
echo "Installing rvm, ruby, and rails"
echo ""

gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --rails

echo ""
echo "Installing nvm"
echo ""

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo ""
echo "All done for now!! yay :)"
echo ""
