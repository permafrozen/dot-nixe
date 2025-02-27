{ pkgs, settings, ... }:

{
  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [ wireshark-qt ];
  services.udev = {
    extraRules = ''
      SUBSYSTEM=="usbmon", GROUP="wireshark", MODE="0640"
    '';
  };

  users.users.${settings.userName} = {
    isNormalUser = true;
    description = "${settings.userName}";
    extraGroups = [ "wireshark" ];
  };
}
