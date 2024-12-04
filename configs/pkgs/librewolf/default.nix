{ settings, pkgs, ... }: {
  home-manager.users.${settings.userName} = {
    programs.librewolf = {
      enable = true;
      package = pkgs.librewolf-wayland;
      languagePacks = [ "en-GB" "de" ];
      settings = {
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;
      };
    };
  };
}
