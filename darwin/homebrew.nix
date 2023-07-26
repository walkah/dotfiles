_:

{
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap";
    global = {
      brewfile = true;
      noLock = true;
    };

    taps = [
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
    ];

    brews = [ "coreutils" ];

    casks = [
      "1password"
      "adobe-acrobat-reader"
      "balenaetcher"
      "bartender"
      "brave-browser"
      "bunch"
      "calibre"
      "dash"
      "discord"
      "docker"
      "element"
      "fantastical"
      "figma"
      "firefox"
      "firefox-developer-edition"
      "font-jetbrains-mono"
      "font-jetbrains-mono-nerd-font"
      "gather"
      "google-chrome"
      "gpg-suite"
      "hazel"
      "ipfs"
      "iterm2"
      "keybase"
      "logitech-options"
      "logseq"
      "microsoft-edge"
      "minecraft"
      "obsidian"
      "plexamp"
      "r"
      "raycast"
      "rescuetime"
      "rocket"
      "rstudio"
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
      Parcel = 639968404;
      Reeder = 1529448980;
      Tailscale = 1475387142;
      Todoist = 585829637;
      UlyssesMac = 1225570693;
      Xcode = 497799835;
    };
  };
}
