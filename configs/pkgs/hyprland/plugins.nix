{
  inputs,
  pkgs,
  settings,
  ...
}:
{
  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland = {
      plugins = [
        inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
        # pkgs.hyprlandPlugins.hypr-dynamic-cursors
      ];
      settings = {
        plugin.dynamic-cursors = {
          enabled = true;

          # sets the cursor behaviour, supports these values:
          # tilt    - tilt the cursor based on x-velocity
          # rotate  - rotate the cursor based on movement direction
          # stretch - stretch the cursor shape based on direction and velocity
          # none    - do not change the cursors behaviour
          mode = "tilt";
          threshold = "2";

          stretch = {
            limit = "3000";
            function = "quadratic";
          };

          shake = {
            enabled = "true";
            nearest = "true";
            threshold = "6.0";
            base = "4.0";
            speed = "4.0";
            influence = "0.0";
            limit = "0.0";
            timeout = "2000";
            effects = "false";
            ipc = "false";
          };

          hyprcursor = {
            nearest = "true";
            enabled = "true";
            resolution = "-1";
            fallback = "clientside";
          };
        };
      };
    };
  };
}
