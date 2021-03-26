{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap";
    global = {
      brewfile = true;
      noLock = true;
    };

    taps = [ "homebrew/cask" "homebrew/cask-drivers" "homebrew/cask-fonts" ];

    brews = [ "coreutils" ];

    casks = [
      "1password"
      "adobe-acrobat-reader"
      "alfred"
      "backblaze"
      "balenaetcher"
      "brave-browser"
      "dash"
      "discord"
      "docker"
      "fantastical"
      "figma"
      "firefox"
      "font-jetbrains-mono"
      "google-chrome"
      "gpg-suite"
      "hazel"
      "iterm2"
      "keybase"
      "microsoft-auto-update"
      "microsoft-edge"
      "microsoft-office"
      "minecraft"
      "plexamp"
      "rescuetime"
      "slack"
      "sonos"
      "spotify"
      "stats"
      "steam"
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
      Parcel = 639968404;
      Reeder = 1529448980;
      Todoist = 585829637;
      UlyssesMac = 1225570693;
      Xcode = 497799835;
    };
  };
}
