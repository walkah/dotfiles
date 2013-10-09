if [ -d $HOME/.cask ]; then
  export PATH="$HOME/.cask/bin:$PATH"
fi
if which cask &> /dev/null; then
  source $(dirname $(which cask))/../etc/cask_completion.zsh
fi
