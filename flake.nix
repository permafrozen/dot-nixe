{
  description = "Main NixOS configuration Flake";

  imports  = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }@Inputs:

  {
    nixosConfigurations.joes-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configs/common/configuration.nix ];
    };
  };
}
