let
  getPath = folderName: ../../configs/pkgs/${folderName}/default.nix;
in {
  imports = [
    (getPath "pipewire")
    (getPath "hyprland")
    (getPath "kitty")
  ];
}
