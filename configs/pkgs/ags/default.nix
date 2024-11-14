{ settings, ... }:

{

  home-manager.users.${settings.userName} = {
    programs.ags = {
      enable = true;

      # ags config dir
      configDir = ./project;

      # additional packages to add to gjs's runtime
      # extraPackages = with pkgs; [
      #   inputs.ags.packages.${pkgs.system}.battery
      #   fzf
      # ];
    };
  };
}
