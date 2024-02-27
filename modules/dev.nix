_:

{
  home = {
    file.".ghci".text = ''
      :set prompt "λ> "
    '';

    file.".npmrc".text = ''
      prefix = ''${HOME}/.local
    '';

    sessionPath = [
      "$HOME/.cargo/bin"
      "$HOME/.deno/bin"
      "$HOME/.config/emacs/bin"
      "$HOME/.go/bin"
      "$HOME/.local/bin"
    ];
  };
}
