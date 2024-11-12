{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ planify ];
}
