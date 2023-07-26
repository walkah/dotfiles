_:

{
  home.file.".ghci".text = ''
    :set prompt "λ> "
  '';

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "$HOME/.deno/bin"
    "$HOME/.emacs.d/bin"
    "$HOME/.go/bin"
    "$HOME/.local/bin"
  ];
}
