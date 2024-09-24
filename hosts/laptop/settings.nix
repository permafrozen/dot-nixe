{
  # system settings
  userName =    "matteo";             # foo@...
  hostName =    "nixos";              # ...@bar
  hostPreset =  "laptop";             # Name of the host config to use (this one is in /laptop)

  # local specifics
  timeZone =    "Europe/Vienna";      # system time
  kbLayout =    "de";                 # Be careful, some layouts are not supported, e.g. "at" for Austria

  # theme
  wallpaper =   "space.png";          # background image, located in .../assets/wallpaper/*
  scheme =      "eris";               # Color Theme (Chose any from the base16-schemes Package)

  rounding = "10";
  gaps = "10";                        # Gaps between windows

  opacity =     "0.7";                # background opacities for supported windows
  blur =        "7";                  # background blur for supported windows
}
