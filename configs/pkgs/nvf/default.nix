{ inputs, ... }:
{
  # environment.systemPackages =
  #   [ inputs.nvf-config.packages.x86_64-linux.default ];
  imports = [ inputs.nvf-config.nixosModules.nvf ];
  programs.nvf.enable = true;
}
