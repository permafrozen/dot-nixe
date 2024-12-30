{ inputs, pkgs, settings, ... }:

{
  imports = [
    ./plugins.nix
    ./configuration.nix
  ];

  # Hyprland Cache, so I don't have to compile it
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys =
      [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # Hyprland NixOS Module
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

    # Flake Inputs -> Hyprland Package
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # For Screenshare
  environment = {
    variables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };

  # Hyprland Home-Manager Module
  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland = {
      enable = true;

      # Flake Input -> Hyprland package
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

      extraConfig = settings.hyprConfig;
    };
  };
}
