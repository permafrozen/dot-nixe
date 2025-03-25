{ pkgs, config, settings, ... }:

let
  vesktop-settings = {
    minimizeToTray = "on";
    discordBranch = "stable";
    arRPC = "on";
    splashColor = "rgb(255, 255, 255)";
    splashBackground =
      "rgba(${config.lib.stylix.colors.base00-dec-r},${config.lib.stylix.colors.base00-dec-g},${config.lib.stylix.colors.base00-dec-b},${settings.opacity})";
    spellCheckLanguages = [ "en-US" "en" ];
  };
in {
  environment.systemPackages = with pkgs; [ vesktop ];
  home-manager.users.${settings.userName} = {
    home.file.".config/vesktop/settings.json".text =
      builtins.toJSON vesktop-settings;
  };
}
