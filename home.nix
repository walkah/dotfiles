{ config, pkgs, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  # home.username = builtins.getEnv "USER";
  # home.homeDirectory = builtins.getEnv "HOME";

  home.sessionPath =
    [ "$HOME/.local/bin" "$HOME/.emacs.d/bin" "$HOME/.cargo/bin" ];

  home.packages = with pkgs; [
    direnv
    exercism
    fd
    git
    gitAndTools.gh
    htop
    jq
    mr
    niv
    nixfmt
    ripgrep
    wakatime
  ];

  home.file.".doom.d" = {
    onChange = ''
      #!/bin/sh
      DOOM=$HOME/.emacs.d
      if [ ! -d $DOOM ]; then
        git clone --depth 1 https://github.com/hlissner/doom-emacs $DOOM
      fi
      $DOOM/bin/doom sync
    '';
    source = ./config/.doom.d;
    recursive = true;
  };

  home.file.".ghci".text = ''
    :set prompt "λ> "
  '';

  programs = {
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
    dircolors = {
      enable = true;
      enableZshIntegration = true;
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

    git = {
      enable = true;
      userName = "James Walker";
      userEmail = "walkah@walkah.net";

      aliases = {
        lg =
          "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        st = "status -s";
        undo = "reset HEAD~1 --mixed";
      };

      extraConfig = {
        github.user = "walkah";
        init.defaultBranch = "main";
        pull.rebase = true;
        rebase.autoStash = true;
      };

      signing = {
        key = "8896FEC44D47A81C";
        signByDefault = true;
      };
    };

    gpg = {
      enable = true;
      settings = { default-key = "8896FEC44D47A81C"; };
    };

    tmux = {
      enable = true;
      extraConfig = ''
        set -g set-titles on
        set -g set-titles-string "[#S] #W@#h (#I)"

        set -g status-bg black
        set -g status-fg white
      '';
      shortcut = "o";
      terminal = "screen-256color";
    };

    emacs = {
      enable = true;
      package = pkgs.emacs-nox;
      extraPackages = epkgs: [ epkgs.vterm ];
    };

    vim = { enable = true; };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
