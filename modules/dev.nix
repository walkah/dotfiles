_:

{
  home.file.".ghci".text = ''
    :set prompt "λ> "
  '';

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "$HOME/.deno/bin"
    "$HOME/.config/emacs/bin"
    "$HOME/.go/bin"
    "$HOME/.local/bin"
  ];
}
