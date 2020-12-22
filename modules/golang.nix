{ pkgs, ... }:

{
  home.sessionPath = [ "$HOME/.go/bin" ];

  home.packages = with pkgs; [
    go
    gocode
    golangci-lint
    gomodifytags
    gopls
    gotests
    gore
  ];

  programs = {
    zsh = {
      oh-my-zsh = { plugins = [ "golang" ]; };
      sessionVariables = { GOPATH = "$HOME/.go"; };
    };
  };
}
