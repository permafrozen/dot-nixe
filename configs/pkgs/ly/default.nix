{ config, pkgs, ...}:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
    };
  };
}