{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    distrobox
  ];

  # Enable Docker Daemon
  virtualisation.docker.enable = true;
}