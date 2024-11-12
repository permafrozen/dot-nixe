{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [ satty grim slurp ];

  home-manager.users.${settings.userName} = {
    home.file.".config/satty/config.toml".text = ''
      [general]
      fullscreen = true
      early-exit = true
      initial-tool = "brush"

      copy-command = "wl-copy"

      # Increase or decrease the size of the annotations
      annotation-size-factor = 1

      # Filename to use for saving action. Omit to disable saving to file. Might contain format specifiers: https://docs.rs/chrono/latest/chrono/format/strftime/index.html
      output-filename = "/home/${settings.userName}/Pictures/Screenshots/satty-%Y-%m-%d_%H:%M:%S.png"

      save-after-copy = false
      default-hide-toolbars = false
      primary-highlighter = "block"
      disable-notifications = false

      # Font to use for text annotations
      [font]
      family = "Hack"
      style = "Bold"

      # custom colours for the colour palette
      [color-palette]
      first= "#00ffff"
      second= "#a52a2a"
      third= "#dc143c"
      fourth= "#ff1493"
      fifth= "#ffd700"
      custom= "#008000"
    '';
  };
}
