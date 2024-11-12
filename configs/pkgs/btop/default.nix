{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ btop ];
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    settings = { };
  };
}
