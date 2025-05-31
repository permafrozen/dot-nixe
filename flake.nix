{
  description = ''
    This is a NixOS configuration flake using home-manager.
  '';

  inputs = {
    hyprland.url = "github:hyprwm/Hyprland?submodules=1";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    ags.url = "github:aylur/ags";
    nur.url = "github:nix-community/NUR";
    stylix.url = "github:danth/stylix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    walker.url = "github:abenz1267/walker";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nvf-config = {
      url = "github:permafrozen/nvf-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim = {
      url = "github:matadaniel/LazyVim-module";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    aglet = {
      url = "github:permafrozen/aglet";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      settings = import ./hosts/laptop/settings.nix;
      dotlib = import ./lib/default.nix { lib = nixpkgs.lib; };
      extensions = inputs.nix-vscode-extensions.extensions.${system};
      args = {
        inherit dotlib;
        inherit system;
        inherit inputs;
        inherit settings;
        inherit extensions;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = args;
        modules = [
          ./configs/core/configuration.nix
          inputs.nur.modules.nixos.default
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
          inputs.nixvim.nixosModules.nixvim
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = args;
              users.${settings.userName} = import ./configs/core/home.nix;
            };
          }
        ];
      };
    };
}
