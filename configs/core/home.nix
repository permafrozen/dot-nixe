{ settings, inputs, ... }:

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
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
