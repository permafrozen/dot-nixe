{ config, pkgs, settings, ... }:

{
  programs.nh = {
    enable = true;
    flake = ../../../. + "/";
  };
}