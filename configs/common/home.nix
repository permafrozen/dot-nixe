{ lib, settings, inputs, ... }:

{
  # ags Module
  imports = if builtins.elem "ags" settings.pkgs then
    [ inputs.ags.homeManagerModules.default ]
  else
    [ ];

  # Information what to manage
  home = {
    username = "${settings.userName}";
    homeDirectory = "/home/${settings.userName}";
    stateVersion = "24.05";
    activation.createDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p Documents
      mkdir -p Downloads
      mkdir -p Music
      mkdir -p Pictures/Screenshots
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
