{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ kew ];
}
