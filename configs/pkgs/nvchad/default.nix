{ pkgs, inputs, settings, ... }: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
    ];
  };

  home-manager.users.${settings.username} = {
    imports = [ inputs.nvchad4nix.homeManagerModule ];
    programs.nvchad.enable = true;
  };
}
