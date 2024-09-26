{ config, pkgs, ...}:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
    };
  };

  # services.getty.loginProgram = "${pkgs.shadow}/bin/ly"; 
}