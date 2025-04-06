{ settings, inputs, lib, ... }:

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

    # Delete Backup File that causes home-manager to implode
    activation.cleanup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      rm -f ~/.zen/default/search.json.mozlz4.backup
    '';

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
