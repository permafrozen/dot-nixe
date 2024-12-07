{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [ "button.lid_init_state=open" ];
  };
}
