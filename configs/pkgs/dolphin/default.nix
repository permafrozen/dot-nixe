{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    libsForQt5.dolphin
  ];
}