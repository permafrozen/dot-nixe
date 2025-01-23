{ settings, ... }: {
  home-manager.users.${settings.userName} = {
    home.file.".config/zed/tasks.json".text = ''
      [
        {

        }
      ]
    '';
  };
}
