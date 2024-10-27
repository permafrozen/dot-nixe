{
  description = "Main NixOS configuration Flake";

  inputs  = {
    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };

    hyprfocus = { 
      url = "github:pyt0xic/hyprfocus";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-easymotion = {
      url = "github:zakk4223/hyprland-easymotion";
      inputs.hyprland.follows = "hyprland";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nur.url = github:nix-community/NUR;
    stylix.url = "github:danth/stylix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    settings = import ./hosts/laptop/settings.nix;
    extensions = inputs.nix-vscode-extensions.extensions.${system};
    args = { inherit inputs; inherit settings; inherit extensions; };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = args;
      modules = [
        ./configs/common/configuration.nix
        inputs.nur.nixosModules.nur
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager {
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
