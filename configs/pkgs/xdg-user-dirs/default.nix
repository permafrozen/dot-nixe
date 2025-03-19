{ settings, ... }:

{
  home-manager.users.${settings.userName} = {
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "$HOME/desktop";
      documents = "$HOME/documents";
      download = "$HOME/downloads";
      videos = "$HOME/videos";
      templates = "$HOME/templates";
      music = "$HOME/music";
      pictures = "$HOME/pictures";
      publicShare = "$HOME/public";
      extraConfig = {
        XDG_DEV_DIR = "$HOME/dev";
        XDG_VIRT_DIR = "$HOME/virt";
      };
    };
  };
}
