{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome.nautilus
  ];
}