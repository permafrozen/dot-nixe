rec {
  # system settings
  userName = "matteo";
  hostName = "nixos";
  hostPreset = "laptop";

  # local specifics
  timeZone = "Europe/Vienna";
  kbLayout = "de"; # some layouts are not supported, e.g. "at" for Austria
  locale = "de_AT";
  searchRegion = "AT";

  # git settings
  gitUser = "Permafrozen";
  gitMail = "permafrozen@disroot.org";
  defaultBranch = "main";

  # theme
  wallpaper = "light-snowy-city.png"; # ../assets/wallpaper/
  scheme = "da-one-black"; # base16-schemes Package
  opacity = "0.3";

  # Setup Specific Hyprland Config
  hyprConfig = ''
    monitor= eDP-1, 1920x1080@60, 0x0, 1
    monitor=HDMI-A-1, 1920x1080@60, auto, 1, mirror, eDP-1
  '';

  # variable apps
  browser = "floorp"; # firefox, floorp, ungoogle-chromium, librewolf
  terminal = "foot"; # kitty, foot

  pkgs = [
    "kernel"
    "pipewire"
    "hyprland"
    "fish"
    "starship"
    "stylix"
    "steam"
    "swww"
    "greetd"
    "lazygit"
    "vscode"
    "libreoffice"
    "yazi"
    "btop"
    "obsidian"
    "quickemu"
    "vesktop"
    "git"
    "syncthing"
    "ani-cli"
    "intellij"
    "bitwarden"
    "fastfetch"
    "nh"
    "satty"
    "hyprlock"
    "kanata"
    "cliphist"
    "distrobox"
    "planify"
    "twingate"
    "nixvim"
    "bluetooth"
    "ags"
    "zathura"
    "tealdeer"
    "walker"
    "neomutt"
    "${terminal}" # BROWSER
    "${browser}" # TERMINAL
  ];

}
