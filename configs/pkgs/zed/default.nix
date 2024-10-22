{ config, pkgs, settings, ...}:

{
  environment.systemPackages = with pkgs; [
    zed-editor
  ];


}