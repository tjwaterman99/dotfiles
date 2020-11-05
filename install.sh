#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
    zsh \
    unzip \
    fontconfig \
    htop \
    tree

# Aliases
echo 'alias pg="pgcli"' >> ~/.zshrc

# Exports
echo '' >> ~/.zshrc
echo '# dotfiles env vars' >> ~/.zshrc
echo 'export PGUSER=dev' >> ~/.zshrc
echo 'export PGHOST=127.0.0.1' >> ~/.zshrc
echo 'export PGPORT=5432' >> ~/.zshrc
echo 'export PGPASSWORD=dev' >> ~/.zshrc
echo 'export PGDATABASE=dev' >> ~/.zshrc

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# Install python 3.8.6 and pipx
pyenv install 3.8.6
pyenv global 3.8.6
pip install --upgrade pip
pip install pipx

# Install various python scripts
pipx install awscli
pipx install pgcli
pipx install csvkit

# Services
docker run \
    --name postgres \
    --detach \
    --publish '5432:5432' \
    -e 'POSTGRES_PASSWORD=dev' \
    -e 'POSTGRES_USER=dev' \
    -e 'POSTGRES_DB=dev' \
    postgres:12

# Install Starship prompt
wget https://starship.rs/install.sh -O install_starship.sh
chmod +x install_starship.sh
./install_starship.sh --yes
echo 'eval "$(starship init zsh)"' >> ~/.zshrc 
