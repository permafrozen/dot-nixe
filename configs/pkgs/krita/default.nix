{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    krita
    opentabletdriver
    # libsForQt5xp-pen-deco-01-v2-driver
  ];
}
