{ ... }: rec {

  #############################################
  # OUTDATE
  # LOOK AT LAPTOP AND FIX TODO
  #############################################

  # system settings
  userName = "matteo";
  hostName = "nixos";
  hostPreset = "desktop";

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
  wallpaper = "dark-red-roses.png"; # ../assets/wallpaper/
  scheme = "da-one-black"; # base16-schemes Package
  opacity = "0.3";
  font-size = "14";
  cursor = "McMojave"; # Bibata-Modern-Classic, McMojave
  hyprcursor = "McMojave-Hypr";

  # Setup Specific Hyprland Config
  hyprConfig = ''
    monitor = HDMI-A-1, 2560x1440@59.95Hz, 0x0, 1
    monitor = DP-1, 1920x1080@60,1920x0, 1
    # monitor = , preferred, auto, 1
  '';

  # variable apps
  browser = "zen"; # firefox, floorp, ungoogle-chromium, librewolf, zen
  terminal = "ghostty"; # kitty, foot, ghostty

  pkgs = [
    # "steam"
    # "mpd"
    # "ncmpcpp"
    "rocket-league"
    "kernel"
    "nvidia"
    "pipewire"
    "hyprland"
    "fish"
    "starship"
    "stylix"
    "swww"
    "sddm" # "sddm" # "greetd"
    # "libreoffice"
    "yazi"
    "btop"
    # "obsidian"
    # "quickemu"
    "discord"
    "git"
    # "syncthing"
    "ani-cli"
    # "jetbrains"
    "fastfetch"
    "nh"
    "hyprlock"
    "kanata"
    # "cliphist" # TODO
    # "distrobox"
    "planify"
    "nixvim"
    # "bluetooth"
    "ags"
    "zathura"
    "tealdeer"
    "walker"
    # "neomutt"
    # "docker"
    "zed"
    "element"
    "${terminal}" # BROWSER
    "${browser}" # TERMINAL
  ];
}
