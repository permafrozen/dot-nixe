{ pkgs, settings, ... }:

{
  environment.systemPackages = [ pkgs.ungoogled-chromium ];

  home-manager.users.${settings.userName} = {
    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
      extensions = [{ id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }];
      dictionaries = with pkgs.hunspellDictsChromium; [ de_DE en_US ];
    };
  };
}
