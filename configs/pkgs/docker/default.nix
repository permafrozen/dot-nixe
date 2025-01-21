{ settings, ... }:

{
  virtualisation.docker.enable = true;
  users.users.${settings.userName}.extraGroups = [ "docker" ];

  # Open Firewall for Connections
  networking.firewall.allowedTCPPorts = [ 3306 ];
}
