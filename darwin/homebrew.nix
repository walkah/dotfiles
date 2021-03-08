{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;
    autoUpdate = true;
    brews = [ "coreutils" "mas" ];
    casks = [
      "1password"
      "alfred"
      "brave-browser"
      "dash"
      "discord"
      "docker"
      "fantastical"
      "figma"
      "firefox"
      "font-jetbrains-mono"
      "google-chrome"
      "hazel"
      "iterm2"
      "keybase"
      "slack"
      "sonos"
      "spotify"
      "stats"
      "syncthing"
      "synology-drive"
      "visual-studio-code"
      "zoom"
    ];
    masApps = {
      Bumpr = 1166066070;
      "Day One" = 1055511498;
      Drafts = 1435957248;
      Magnet = 441258766;
      Todoist = 585829637;
      Xcode = 497799835;
    };
  };
}
