{ settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.neomutt = {
      enable = true;
      editor = "nvim";
      vimKeys = true;
      settings = {
      
      };
    };
  };
}
