{ config, lib, pkgs, ... }:

{
  programs = {
    bat.enable = true;
    btop.enable = true;
    dircolors.enable = true;
    direnv.enable = true;
    exa.enable = true;
    fzf = {
      enable = true;
      fileWidgetOptions = [ "--preview 'bat --color always {}'" ];
    };

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "bundler"
          "direnv"
          "docker"
          "docker-compose"
          "git"
          "golang"
          "mix"
          "rails"
          "ssh-agent"
          "tmux"
        ];
      };
      sessionVariables = {
        EDITOR = "vim";
        GOPATH = "$HOME/.go";
      };
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        character = {
          success_symbol = "[»](bold green) ";
          error_symbol = "[✗](bold red) ";
        };
        directory = {
          fish_style_pwd_dir_length = 1;
          truncation_length = 1;
        };
        hostname = {
          ssh_only = false;
          format = "[$hostname]($style):";
        };
        gcloud = { disabled = true; };
        kubernetes = { disabled = false; };
        username = { format = "[$user]($style)@"; };
      };
    };

  };
}
