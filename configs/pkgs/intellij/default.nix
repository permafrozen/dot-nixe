{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    idea-ultimate
  ];
}