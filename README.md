This repo can be used to quickly setup an ubuntu wsl on windows. 

It installs the following main tools :

* shell: zsh
* prompt: starship
* package-manager: homebrew
* Docker
* Volta for managing node, yarn, pnpm...

It also comes with this other tools that you may choose to use or not

* neovim
* tmux

Some utilities are also installed :

* zoxide
* ripgrep
* just
* yq
* lazydocker
* lazygit
* kubectl
* k9s
* helm
* go
* node
* yarn@1
* pnpm

The following zsh plugins are installed :

* zsh-autosuggestions
* zsh-syntax-highlighting
* zsh-autocomplete

I use the catppuccin mocha theme so it will be installed by default. I plan to add options for you to choose wether you want to install it or keep the default theme for the following tools :

* TODO 

If you want to use the catppuccin theme, you should probably also configure it for your terminal on the windows side : [https://github.com/catppuccin/catppuccin]

Also you will need a Nerd Font for your terminal [https://www.nerdfonts.com/]

## Prerequisites

* Git needs to be installed on the windows host.
* A fresh wsl install of Ubuntu

## Installation

Just clone this repo and run the install script as sudo

```
    git clone https://github.com/LucasRoig/dotfiles-wsl.git .dotfiles
    cd .dotfiles
    # install cannot be runned as root !!
    ./install
```

When the script ends you need to shutdown wsl from a powershell terminal : `wsl --shutdown`, then reopen it and you should see a zsh shell.

If you plan on using tmux you should open it and install the plugins with `C-a I` (plugins are handled by tpm [https://github.com/tmux-plugins/tpm])



## Aliases

Some aliases are configured in the shell :

* TODO

## TODO

* detail aliases
* split zshrc
* optional themes
* check if gcloud is added to zshrc (run each command with zsh -c ?)