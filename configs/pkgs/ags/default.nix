{ settings, inputs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  home-manager.users.${settings.userName} = {
    programs.ags = {
      enable = true;
    };
  };
}
