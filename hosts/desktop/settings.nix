{
  # system settings
  userName =      "matteo";                      # foo@...
  hostName =      "nixos";                       # ...@bar
  hostPreset =    "desktop";                     # Name of the host config to use (this one is in /laptop)

  # local specifics
  timeZone =      "Europe/Vienna";               # system time
  kbLayout =      "de";                          # Be careful, some layouts are not supported, e.g. "at" for Austria
  locale =        "de_AT";                       # I think this one explains itself
  searchRegion =  "AT";                          # Region for browsing purposes

  # git settings
  gitUser =       "Permafrozen";
  gitMail =       "permafrozen@disroot.org";
  defaultBranch = "main";

  # theme
  wallpaper =     "starry-night.png";          # background image, located in .../assets/wallpaper/ , also write the file ending!
  scheme =        "ayu-dark";                        # Color Theme (Chose any from the base16-schemes Package)

  # hyprland
  rounding =      "10";                           # Corner rounding
  gaps =          "10";                           # Gaps between windows
  shadow =        "false";                        # Wheater to enable window shadow
  opacity =       "0.8";                          # background opacities for supported windows

  # Setup Specific Hyprland Config
  hyprConfig = ''
    monitor= HDMI-A-1, 1920x1080@60, 0x0, 1
    monitor= DP-1, 1920x1080@60, 1920x0, 1
    workspace = 2, monitor:DP-1, default:true
  '';

  # default apps
  browser =       "firefox";                      # only firefox for now
  terminal =      "foot";                         # only kitty for now
}
