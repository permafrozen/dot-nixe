{ config, settings, pkgs, ... }: {

  # system
  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh.enable = true; # system module
  users.defaultUserShell = pkgs.zsh; # ^

  home-manager.users.${settings.userName} = {
    # misc
    programs.zoxide.enable = true;

    # zsh
    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "";
        plugins = [ "gh" "fzf" "starship" "zoxide" ];
      };
      autosuggestion = {
        enable = true;
        highlight = "fg=#${config.lib.stylix.colors.base04}";
        strategy = [ "history" "completion" ];
      };
      shellAliases = {
        ls = "eza";
        cd = "z";
        edi = "zeditor ./";
        nos = "nh os switch .";
      };
      initExtraFirst = ''
        DISABLE_AUTO_UPDATE="true"
        DISABLE_MAGIC_FUNCTIONS="true"
        DISABLE_COMPFIX="true"
      '';
      initExtraBeforeCompInit = ''
        autoload -Uz compinit
        if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
            compinit
        else
            compinit -C
        fi
      '';
      initExtra = "\n";
    };
  };
}
