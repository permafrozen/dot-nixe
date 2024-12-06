{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    jdk21
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };
}
