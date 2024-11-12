{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ yazi ];
}
