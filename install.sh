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

# Change shell to zsh
sudo chsh -s /usr/bin/zsh

# Aliases
echo 'alias pg="pgcli"' >> ~/.zshrc

# Exports
# echo 'export EDITOR="code -w"' >> ~/.zshrc # vscode as default editor

# Install pyenv
# git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
# echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# Install FireMono font
# mkdir ~/.fonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
# unzip -o -d ~/.fonts FiraMono.zip
# rm FiraMono.zip
# fc-cache -fv

# Install Starship prompt
# curl -fsSL https://starship.rs/install.sh | bash
# echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Set up a postgres db
# createdb $USER