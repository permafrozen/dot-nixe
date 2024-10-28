{ config, pkgs, settings, ... }:

{
  services.kanata = {
    enable = true;
    keyboards.default = {
      config = ''
        (defsrc
          caps
          lmet 
        )

        (deflayer start
          lmet
          caps
        )
      '';
    };
  };
}