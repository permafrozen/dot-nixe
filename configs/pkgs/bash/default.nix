{ pkgs, settings, ... }: {
  home-file.users.${settings.userName} = {
    programs.bash = { enable = true; };
    programs.starship.enableBashIntegration = true;
  };
}
