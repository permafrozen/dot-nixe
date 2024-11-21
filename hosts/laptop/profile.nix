{ settings, ... }:
let getPath = folderName: ../../configs/pkgs/${folderName}/default.nix;
in {
  imports = [
    # Normal Apps
    (getPath "pipewire")
    (getPath "hyprland")
    (getPath "fish")
    (getPath "starship")
    (getPath "stylix")
    (getPath "swww")
    (getPath "greetd")
    (getPath "lazygit")
    (getPath "vscode")
    (getPath "libreoffice")
    (getPath "yazi")
    (getPath "btop")
    (getPath "obsidian")
    (getPath "quickemu")
    (getPath "vesktop")
    (getPath "git")
    (getPath "syncthing")
    (getPath "ani-cli")
    (getPath "intellij")
    (getPath "bitwarden")
    (getPath "fastfetch")
    (getPath "nh")
    (getPath "satty")
    (getPath "hyprlock")
    (getPath "kanata")
    (getPath "cliphist")
    (getPath "distrobox")
    (getPath "planify")
    (getPath "twingate")
    (getPath "nixvim")
    (getPath "bluetooth")
    (getPath "ags")
    (getPath "zathura")
    (getPath "tealdeer")

    # Variable Apps
    (getPath "${settings.terminal}") # BROWSER
    (getPath "${settings.browser}") # TERMINAL
  ];
}
