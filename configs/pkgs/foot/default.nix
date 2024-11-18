{ settings, lib, ... }:

{
  programs.foot = { enableFishIntegration = true; };

  home-manager.users.${settings.userName} = {
    programs.foot = {
      enable = true;
      server.enable = false;
      settings = {
        main = {
          pad = "18x18 center";
          vertical-letter-offset = "-4px";
          line-height = "25px";
          letter-spacing = "-1px";
          bold-text-in-bright = "palette-based";
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
