{ settings, ... }:
  let
    getPath = folderName: ../../configs/pkgs/${folderName}/default.nix;
  in 
{
  imports = [
    # Normal Apps
    (getPath "fish")
    (getPath "stylix")
    (getPath "lazygit")
    (getPath "yazi")
    (getPath "bottom")
    (getPath "git")
    (getPath "syncthing")
    (getPath "fastfetch")

    # Variable Apps
    # (getPath "${settings.terminal}")  # BROWSER
    # (getPath "${settings.browser}")   # TERMINAL
  ];
}
