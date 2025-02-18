{ lib, settings, inputs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
    inputs.walker.homeManagerModules.default
  ];

  # Information what to manage
  home = {
    username = "${settings.userName}";
    homeDirectory = "/home/${settings.userName}";
    stateVersion = "24.05";
    activation.createDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p Documents
      mkdir -p Downloads
      mkdir -p Music
      mkdir -p Mail
      mkdir -p Pictures/Screenshots
      mkdir -p Dev
      mkdir -p Games
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
