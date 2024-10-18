{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    bitwarden-cli
  ];
}