{
  # system settings
  userName =      "matteo";                       # foo@...
  hostName =      "nixos";                        # ...@bar
  hostPreset =    "laptop";                       # Name of the host config to use (this one is in /laptop)

  # local specifics
  timeZone =      "Europe/Vienna";                # system time
  kbLayout =      "de";                           # Be careful, some layouts are not supported, e.g. "at" for Austria
  locale =        "de_AT";                        # I think this one explains itself
  searchRegion =  "AT";                           # Region for browsing purposes

  # git settings
  gitUser =       "Permafrozen";
  gitMail =       "permafrozen@disroot.org";
  defaultBranch = "main";

  # theme
  wallpaper =     "blue-stars.png";          # background image, located in .../assets/wallpaper/ , also write the file ending!
  scheme =        "ayu-dark";                        # Color Theme (Chose any from the base16-schemes Package)

  # hyprland
  rounding =      "10";                           # Corner rounding
  gaps =          "10";                           # Gaps between windows
  shadow =        "false";                        # Wheater to enable window shadow
  opacity =       "0.8";                          # background opacities for supported windows

    # Setup Specific Hyprland Config
  hyprConfig = ''
    monitor= eDP-1, 1920x1080@60, 0x0, 1
    monitor=HDMI-A-1, 1920x1080@60, auto, 1, mirror, eDP-1
  '';

  # default apps
  browser =       "firefox";                      # only firefox for now
  terminal =      "foot";                         #  kitty, foot
}
