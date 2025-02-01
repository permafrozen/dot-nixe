{ pkgs, ... }:

{
  environment.systemPackages = [ (pkgs.callPackage ./last-theme.nix { }) ];
  services.displayManager.sddm = {
    enable = true;
    theme = "last-theme";
    wayland.enable = true;
  };
}
