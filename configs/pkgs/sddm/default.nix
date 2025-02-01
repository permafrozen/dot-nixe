{ pkgs, ... }:

let last-theme = pkgs.callPackage ./last-theme.nix { };
in {
  environment.systemPackages = [ last-theme ];
  services.displayManager.sddm = {
    enable = true;
    theme = "last-theme";
    wayland.enable = true;
  };
}
