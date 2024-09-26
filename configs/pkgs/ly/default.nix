{ config, pkgs, ...}:

{
  services.displayManager.ly = {
    enable = true;
  };

  # services.getty.loginProgram = "${pkgs.shadow}/bin/ly"; 
}