{ pkgs, config, settings, ... }:

let
  vesktop-settings = (builtins.fromJSON (builtins.readFile ./settings.json))
    // {
      transparent = true;
      plugins = { ClearURLs.enabled = true; };
    };
  sys-settings = {
    minimizeToTray = "on";
    discordBranch = "stable";
    arRPC = "on";
    splashColor =
      "rgb(${config.lib.stylix.colors.base05-rgb-r},${config.lib.stylix.colors.base05-rgb-g},${config.lib.stylix.colors.base05-rgb-b})";
    splashBackground =
      "rgba(${config.lib.stylix.colors.base00-rgb-r},${config.lib.stylix.colors.base00-rgb-g},${config.lib.stylix.colors.base00-rgb-b},${settings.opacity})";
    spellCheckLanguages = [ "en-US" "en" "de" ];
  };
in {
  environment.systemPackages = with pkgs; [ vesktop ];
  home-manager.users.${settings.userName} = {
    home.file = {
      sys-settings = {
        target = ".config/vesktop/settings.json";
        text = builtins.toJSON sys-settings;
      };
      vesktop-settings = {
        target = ".config/vesktop/settings/settings.json";
        text = builtins.toJSON vesktop-settings;
      };
    };
  };
}
