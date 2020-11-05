# dotfiles

## Changing the default shell

Open your `settings.json` in VS code (CMD P, search for settings), and update the shell for linux.

```json
"terminal.integrated.shell.linux": "/usr/bin/zsh"
```

Then re-open the workspace.

## Installing fonts

Install FireMono font. Note that these should be installed locally if you're using VSCode's desktop app to use the CodeSpace

```bash
mkdir ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0/FiraMono.zip
unzip -o -d ~/.fonts FiraMono.zip
rm FiraMono.zip
fc-cache -fv
```
