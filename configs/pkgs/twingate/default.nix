{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ twingate ];

  services.twingate = {
    package = pkgs.twingate;
    enable = true;
  };
}
