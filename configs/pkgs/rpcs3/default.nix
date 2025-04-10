{ pkgs, ... }: {

  # Firmware https://www.playstation.com/en-us/support/hardware/ps3/system-software/
  environment.systemPackages = with pkgs; [ rpcs3 ];

}
