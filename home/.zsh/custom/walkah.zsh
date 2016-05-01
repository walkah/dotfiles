# oh-my-zsh complains without a .zsh file in here

autoload -U add-zsh-hook
load-nvmrc() {
    if [[ -f .nvmrc && -r .nvmrc ]]; then
          nvm use
            fi
}
add-zsh-hook chpwd load-nvmrc
