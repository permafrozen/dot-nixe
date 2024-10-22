{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    yazi
  ];
}