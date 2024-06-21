{ pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      mouse = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        {
          plugin = dracula;
          extraConfig = ''
            set -g @dracula-show-battery true
            set -g @dracula-show-fahrenheit false
            set -g @dracula-show-left-icon session
            set -g @dracula-show-powerline true
            set -g @dracula-refresh-rate 10
          '';
        }
      ];
      extraConfig = ''
        set -g set-titles on
        set -g set-titles-string "[#S] #W@#h (#I)"
      '';
      shortcut = "o";
    };
  };
}
