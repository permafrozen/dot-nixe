{ config, pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
  ];

  # TODO TODO TODO !!!
}