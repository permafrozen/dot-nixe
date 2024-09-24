{ config, pkgs, settings, ...}:

{
  home-manager.sharedModules = [{
    programs.kitty = {
      enable = true;
      settings = {
        foreground = "#FFFFFF";
        background = "#${config.lib.stylix.colors.base00}";
        background_opacity = "0.7";
        background_blur = "7";
        confirm_os_window_close = "0";
      };
    };
  }];
  environment.systemPackages = with pkgs; [
    acpi
    git
    nurl
    tree
    vim
    wget
  ];
}
