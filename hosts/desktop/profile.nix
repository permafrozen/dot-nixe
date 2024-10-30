{ settings, ... }:
  let
    getPath = folderName: ../../configs/pkgs/${folderName}/default.nix;
  in 
{
  imports = [
    # Normal Apps
    (getPath "pipewire")
    (getPath "hyprland")
    (getPath "fish")
    (getPath "starship")
    (getPath "stylix")
    (getPath "swww")
    (getPath "ly")
    (getPath "lazygit")
    (getPath "vscode")
    (getPath "libreoffice")
    (getPath "yazi")
    (getPath "bottom")
    (getPath "obsidian")
    # (getPath "quickemu")
    (getPath "vesktop")
    (getPath "git")
    # (getPath "syncthing")
    (getPath "ani-cli")
    (getPath "mpd")
    (getPath "ncmpcpp")
    (getPath "fastfetch")
    (getPath "nh")
    (getPath "satty")
    (getPath "hyprlock")
    (getPath "kanata")
    (getPath "cliphist")
    (getPath "steam")
    (getPath "nautilus")

    # GPU Settings
    (getPath "nvidia")

    # Variable Apps
    (getPath "${settings.terminal}")  # BROWSER
    (getPath "${settings.browser}")   # TERMINAL
  ];
}
