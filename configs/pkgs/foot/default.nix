{ settings, lib, ... }:

{
  programs.foot = { enableFishIntegration = true; };

  home-manager.users.${settings.userName} = {
    programs.foot = {
      enable = true;
      server.enable = false;
      settings = {
        main = {
          resize-delay-ms = "80";
        };

        cursor = {
          style = "beam";
          blink = true;
        };

        mouse = { hide-when-typing = true; };
        colors = { alpha = lib.mkForce "0.5"; };
      };
    };
  };
}
