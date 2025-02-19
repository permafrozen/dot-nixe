{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [ legcord ];
}
