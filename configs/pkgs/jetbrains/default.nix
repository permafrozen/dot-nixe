{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.datagrip
    jdk21
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };
}
