{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    ly
  ];

  services.displayManager.ly = {
    enable = true;
    # settings = {

    # };
  };
}