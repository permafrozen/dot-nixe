{ settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs = {
      git = {
        enable = true;
        userName = settings.gitUser;
        userEmail = settings.gitMail;
        extraConfig = { init.defaultBranch = settings.defaultBranch; };
      };
      gh = {
        enable = true;
        settings = {
          git_protocol = "ssh";
          aliases = {
            #TODO
          };
        };
      };
      lazygit = {
        enable = true;
        settings = { };
      };
    };
  };
}
