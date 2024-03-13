_:

{
  programs = {
    bat = {
      enable = true;
      config = {
        theme = "Dracula";
      };
    };
    btop.enable = true;
    direnv.enable = true;
    eza = {
      enable = true;
      extraOptions = [ "--header" ];
      git = true;
    };
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
          "1password"
          "bundler"
          "direnv"
          "docker"
          "docker-compose"
          "git"
          "golang"
          "mix"
          "rails"
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
        # TODO re-enable after https://github.com/starship/starship/issues/5350
        battery = {
          disabled = true;
        };
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

  home = {
    shellAliases = {
      cat = "bat";
    };
  };
}
