{ settings, ... }:

{
  virtualisation.docker.enable = true;
  users.users.${settings.userName}.extraGroups = [ "docker" ];
}
