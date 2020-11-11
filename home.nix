{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.packages = [
    pkgs.emacs
    pkgs.git
    pkgs.htop
    pkgs.pinentry
    pkgs.pinentry-curses
    pkgs.ripgrep
  ];

  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "ssh-agent"
          "tmux"
        ];
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
        gcloud = {
          disabled = true;
        };
        hostname = {
          ssh_only = false;
          format = "[$hostname]($style):";
        };
        username = {
          format = "[$user]($style)@";
        };
      };
    }; 

    git = {
      enable    = true;
      userName  = "James Walker";
      userEmail = "walkah@walkah.net";

      signing = {
        key           = "8896FEC44D47A81C";
        signByDefault = true;
      };
    };

    gpg = {
      enable = true;
      settings = {
        default-key = "8896FEC44D47A81C";
      };
    };

    tmux = {
      enable = true;
    };
  
    vim = {
      enable = true;
    };
  };

  services = {
      gpg-agent = {
        enable           = true;
        enableSshSupport = true;
        extraConfig = ''
          allow-emacs-pinentry
        '';
      };
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
