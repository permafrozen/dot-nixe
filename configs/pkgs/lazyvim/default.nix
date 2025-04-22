{ settings, pkgs, ... }:
let
  lazyvim = pkgs.fetchFromGitHub {
    owner = "LazyVim";
    repo = "starter";
    rev = "803bc181d7c0d6d5eeba9274d9be49b287294d99";
    hash = "sha256-QrpnlDD4r1X4C8PqBhQ+S3ar5C+qDrU1Jm/lPqyMIFM=";
  };
in {
  environment.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
  };

  # just wanted to test it real quick, don't actually use this solution
  environment.systemPackages = with pkgs; [ neovim gcc ];
  home-manager.users.${settings.userName} = {
    home.file.".config/nvim".source = lazyvim;
  };
}
