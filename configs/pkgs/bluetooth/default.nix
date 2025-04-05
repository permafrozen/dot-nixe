{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    settings = { General = { Experimental = true; }; };
  };

  environment.systemPackages = [ pkgs.bluetui ];
}
