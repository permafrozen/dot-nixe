{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    quickemu
    spice-gtk
  ];
  services.samba.enable = true;

  # Enable virt-manager and dconf
  programs.virt-manager.enable = true;
  programs.dconf.enable = true;

  # Enable libvirtd
  virtualisation.libvirtd = {
    enable = true;
    allowedBridges = [ "br0" ];
  };

  # networking = {
  #   bridges.br0.interfaces = [ "eth0" ];
  #   interfaces.br0.useDHCP = true;
  #   interfaces.eth0.useDHCP = false;
  # };

  virtualisation.virtualbox.host.enable = true;

  # Ensure user is added to the libvirtd group
  users.users.${settings.userName}.extraGroups = [ "libvirtd" ];

  # Kernel module and virtualization settings specific to AMD
  boot.kernelModules = [
    "kvm"
    "kvm-amd"
  ]; # Use "kvm-amd" for AMD CPUs
  boot.kernelParams = [
    "amd_iommu=on"
    "iommu=pt"
  ]; # Enable IOMMU for AMD
}
