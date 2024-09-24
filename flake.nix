{
  description = "Main NixOS configuration Flake";

  inputs  = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = { 
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    settings = import ./hosts/laptop/settings.nix // 
    {
      base00 = "2a3b4d";
      base01 = "3d566f";
      base02 = "4b6988";
      base03 = "55799c";
      base04 = "7e90a3";
      base05 = "9fa2a6";
      base06 = "d6d7d9";
      base07 = "ffffff";
      base08 = "c4676c";
      base09 = "ff9966";
      base0A = "ffff66";
      base0B = "66ff66";
      base0C = "4b8f77";
      base0D = "15f4ee";
      base0E = "9c6cd3";
      base0F = "bb64a9";
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; inherit settings; };
      modules = [
        ./configs/common/configuration.nix
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; inherit settings; };
            users.matteo = import ./configs/common/home.nix;
          };
        }
      ];
    };
  };
}
