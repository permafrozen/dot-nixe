{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    nyxt
  ];
}