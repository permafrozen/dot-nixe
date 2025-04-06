{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ krita opentabletdriver ];
}
