{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [ btop ];

  home-manager.users.${settings.userName} = {
    programs.btop = {
      enable = true;
      package = pkgs.btop;
      settings = {
        color_theme = "stylix";
        theme_background = false;
        vim_keys = true;
        rounded_corners = true;
      };
    };
  };
}
