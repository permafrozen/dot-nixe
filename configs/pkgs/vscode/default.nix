{
  pkgs,
  lib,
  settings,
  extensions,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    vscodium
    nixd
    nixfmt-rfc-style
  ];

  programs.direnv.enable = true;
  home-manager.users.${settings.userName} = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium; # Use VSCodium as the VSCode package
      extensions = with extensions.vscode-marketplace; [
        jnoortheen.nix-ide
        vscodevim.vim
        svelte.svelte-vscode
        esbenp.prettier-vscode
        svelte.svelte-vscode
        tauri-apps.tauri-vscode
        rust-lang.rust-analyzer
      ];
      profiles.default.userSettings = {

        # Font Settings
        "editor.fontSize" = lib.mkForce (lib.toInt settings.font-size);
        "chat.editor.fontSize" = lib.mkForce (lib.toInt settings.font-size);
        "debug.console.fontSize" = lib.mkForce (lib.toInt settings.font-size);
        "markdown.preview.fontSize" = lib.mkForce (lib.toInt settings.font-size);
        "scm.inputFontSize" = lib.mkForce (lib.toInt settings.font-size);
        "terminal.integrated.fontSize" = lib.mkForce (lib.toInt settings.font-size);

        # Editor Settigns
        "editor.cursorBlinking" = "phase";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.smoothScrolling" = "true";
        "editor.renderControlCharacters" = false;
        "editor.stickyScroll.enabled" = false;
        "editor.lineNumbers" = "relative";
        "terminal.integrated.fontFamily" = "'Hack Nerd Font'";
        "terminal.integrated.smoothScrolling" = "true";
        "workbench.sideBar.location" = "right";
        "workbench.editor.showTabs" = "multiple";
        "workbench.welcomePage.extraAnnouncements" = false;
        "workbench.layoutControl.enabled" = false;
        "workbench.editor.editorActionsLocation" = "hidden";
        "window.commandCenter" = false;
        "window.experimentalControlOverlay" = false;
        "window.titleBarStyle" = "custom";
        "window.menuBarVisibility" = "toggle";
        "window.density.editorTabHeight" = "compact";
        "window.zoomLevel" = 2;
        "workbench.startupEditor" = "none";

        # Default Formater
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };

        # Svelte ts support
        "svelte.enable-ts-plugin" = true;
        "[svelte]" = {
          "editor.defaultFormatter" = "svelte.svelte-vscode";
        };

        # nix-plugin
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";

        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
          };
        };

        # Scrollbar Settings
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "editor.minimap.enabled" = false;

        # Vim Keybinds Plugin
        "vim.useCtrlKeys" = false;
      };
    };
    stylix.targets.vscode.enable = true;
  };
}
