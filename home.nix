{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  xdg.configFile."starship.toml".source = ./home/.config/starship.toml;

  home.packages = with pkgs; [
    cmake
    direnv
    docker
    docker-compose
    git
    htop
    pinentry
    ripgrep
    sqlite
    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

  ];

  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "docker"
          "git"
          "ssh-agent"
          "tmux"
        ];
      };
      sessionVariables = {
        EDITOR = "vim";
      };
    };
    starship.enable = true;
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
      extraConfig = ''
        set -g status-bg black
        set -g status-fg white
      '';
      newSession = true;
      shortcut = "o";
      terminal = "screen-256color";
    };
  
    vim = {
      enable = true;
    };
  };

  services = {
    lorri.enable = true;
    gpg-agent = {
      enable           = true;
      enableSshSupport = true;
      extraConfig = ''
        allow-emacs-pinentry
        allow-loopback-pinentry
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
