#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
    zsh \
    unzip \
    fontconfig \
    htop \
    tree \
    nginx \
    awscli \
    postgresql \
    postgresql-contrib \
    pgcli

# Install awless
# curl https://raw.githubusercontent.com/wallix/awless/master/getawless.sh | bash
# tar -xzf awless-linux-386.tar.gz
# sudo mv awless /usr/local/bin

# Aliases
echo 'alias pg="pgcli"' >> ~/.zshrc

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# Install FireMono font. Note that these should be installed locally if you're
# using VSCode's desktop app to use the CodeSpace
# mkdir ~/.fonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
# unzip -o -d ~/.fonts FiraMono.zip
# rm FiraMono.zip
# fc-cache -fv

# Install Starship prompt
wget https://starship.rs/install.sh -O install_starship.sh
chmod +x install_starship.sh
./install_starship.sh --yes
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Start postgres
sudo service postgresql start
# createdb $USER