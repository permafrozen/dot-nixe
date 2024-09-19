{ inputs, config, pkgs, ... }:

{
  # Information what to manage
  home = {
    username = vars.username;
    homeDirectory = "/home/matteo";
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
 
}
