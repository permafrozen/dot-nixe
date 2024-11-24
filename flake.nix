{
  description = "Main NixOS configuration Flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    ags.url = "github:aylur/ags";
    nur.url = "github:nix-community/NUR";
    stylix.url = "github:danth/stylix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    inputs.walker.url = "github:abenz1267/walker";
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      settings = import ./hosts/laptop/settings.nix;
      extensions = inputs.nix-vscode-extensions.extensions.${system};
      args = {
        inherit inputs;
        inherit settings;
        inherit extensions;
      };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = args;
        modules = [
          ./configs/common/configuration.nix
          inputs.nur.nixosModules.nur
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
          inputs.nixvim.nixosModules.nixvim
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "dotnixbk";
              extraSpecialArgs = args;
              users.${settings.userName} = import ./configs/common/home.nix;
            };
          }
        ];
      };
    };
}
