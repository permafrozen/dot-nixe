{ settings, ... }:
  let
    getPath = folderName: ../../configs/pkgs/${folderName}/default.nix;
  in 
{
  imports = [
    # Normal Apps
    (getPath "fish")
    (getPath "lazygit")
    (getPath "yazi")
    (getPath "bottom")
    (getPath "git")
    (getPath "syncthing")
    (getPath "fastfetch")
    (getPath "ssh")
  ];
}
