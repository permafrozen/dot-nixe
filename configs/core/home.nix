{ settings, ... }:

{
  # Information what to manage
  home = {
    username = "${settings.userName}";
    homeDirectory = "/home/${settings.userName}";
    stateVersion = "24.05"; # careful, like nixos version
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
