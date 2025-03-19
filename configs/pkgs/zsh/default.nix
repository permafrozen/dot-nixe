{ config, settings, ... }: {
  environment.pathsToLink = [ "/share/zsh" ];
  home-manager.users.${settings.userName} = {
    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "";
        plugins = [ "gh" "starship" ];
      };
      autosuggestion = {
        enable = true;
        highlight = "fg=#${config.lib.stylix.colors.base04},italic";
        strategy = [ "history" "completion" ];
      };
    };
  };
}
