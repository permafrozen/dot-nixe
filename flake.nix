{
  description = "Main NixOS configuration Flake";

  inputs  = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = { 
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.matteo = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
        ./configs/common/configuration.nix 
        inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.matteo = import ./configs/common/home.nix;
          };
        }
      ];
    };
  };
}
