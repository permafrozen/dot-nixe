{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ distrobox ];

  # Enable Docker Daemon
  virtualisation.docker.enable = true;
}
