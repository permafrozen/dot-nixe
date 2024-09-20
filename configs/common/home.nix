{ config, pkgs, settings, ... }:

{
  # Information what to manage
  home = {
    username = "${settings.username}";
    homeDirectory = "/home/${settings.username}";
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
 
}
