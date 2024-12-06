{ pkgs, ... }:

let kernel = pkgs.linuxKernel.kernels.linux_xanmod_stable; # improved daily usage performance
in {
  environment.systemPackages = [ kernel ];
  boot.kernelPackages = kernel;
}
