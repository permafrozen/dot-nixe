{ pkgs, settings, ... }:

{
  virtualisation.docker.enable = true;
  users.users.${settings.userName}.extraGroups = [ "docker" ];

  environment.systemPackages = [ pkgs.mysql-workbench pkgs.jetbrains.datagrip ];

  # Open Firewall for Connections
  networking.firewall.allowedTCPPorts = [ 3306 ];
}
