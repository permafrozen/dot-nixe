{
  config,
  settings,
  pkgs,
  ...
}:

{

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Enable Waydroid for Android apps
  # for AMD GPUs: /var/lib/waydroid/waydroid_base.prop the following:
  # sys.use_memfd=true
  # debug.stagefright.ccodec=0
  # # ro.hardware.gralloc=gbm
  # # ro.hardware.egl=mesa
  # ro.hardware.gralloc=default
  # ro.hardware.egl=swiftshader
  #
  # ro.hardware.vulkan=radeon
  # ro.hardware.camera=v4l2
  # ro.opengles.version=196609
  # waydroid.system_ota=https://ota.waydro.id/system/lineage/waydroid_x86_64/VANILLA.json
  # waydroid.vendor_ota=https://ota.waydro.id/vendor/waydroid_x86_64/MAINLINE.json
  # waydroid.tools_version=1.4.3
  # ro.vndk.lite=true
  # virtualisation.waydroid.enable = true;

  # Add user to libvirtd group
  users.users.${settings.userName}.extraGroups = [ "libvirtd" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
