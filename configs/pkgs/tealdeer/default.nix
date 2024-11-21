{ settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.tealdeer = {
      enable = true;
      settings = {
        
      };
    };
  };
}