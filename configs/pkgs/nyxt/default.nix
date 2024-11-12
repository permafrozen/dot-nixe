{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [ nyxt ];

  home-manager.users.${settings.userName} = {
    home.file.".config/nyxt/config.lisp".text = ''
      ;; vi keybinds
        (define-configuration buffer
          ((default-modes
            (pushnew 'nyxt/mode/vi:vi-normal-mode %slot-value%)))) 

      (define-configuration web-buffer
        ((default-modes
          (pushnew 'nyxt/mode/blocker:blocker-mode %slot-value%))))

      (define-configuration web-buffer
        ((default-modes
          (pushnew 'nyxt/mode/reduce-tracking:reduce-tracking-mode %slot-value%))))
    '';
  };
}
