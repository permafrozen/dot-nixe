{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
  ];
}