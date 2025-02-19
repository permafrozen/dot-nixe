{ pkgs, inputs, ... }: {

  # cachix config
  nix.settings = {
    substituters = [ "https://nix-gaming.cachix.org" ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  # needed programs
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  # package
  environment.systemPackages = [ # or home.packages
    inputs.nix-gaming.packages.${pkgs.system}.rocket-league # installs a package
    pkgs.legendary-gl
  ];
}
