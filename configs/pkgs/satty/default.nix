{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    satty
  ];

  # home-manager.users.${settings.userName} = {
    
  # };
}