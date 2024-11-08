{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    distrobox
    distrobox-tui
  ];
}