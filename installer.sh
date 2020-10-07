#!/bin/bash
CYAN='\033[1;36m'
NC='\033[0m' # No Color

vimrc_repo="https://github.com/nupejosh/.vimrc.git"
tmux_repo="https://github.com/nupejosh/.tmux.conf.git"

echo ""
echo -e "${CYAN}Installing vim config${NC}"
echo ""

mkdir -p ~/.vim/backup
git clone "$vimrc_repo" "~/.vim/.vimrc"
vim +PluginInstall +qall  

echo ""
echo -e "${CYAN}Installing tmux and config${NC}"
echo ""
 
git clone "$tmux_repo" "~/.tmux.conf"
sudo pacman -S tmux --noconfirm

echo ""
echo -e "${CYAN}Installing rvm, ruby, and rails${NC}"
echo ""

#gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
\curl -sSL https://get.rvm.io | bash -s stable --rails

echo ""
echo -e "${CYAN}Installing nvm${NC}"
echo ""

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo ""
echo -e "${CYAN}All done for now!! yay :)${NC}"
echo ""
