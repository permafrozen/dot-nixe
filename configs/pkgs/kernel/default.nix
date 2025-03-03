{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod;
    kernelParams = [ "button.lid_init_state=open" ];
  };
}
