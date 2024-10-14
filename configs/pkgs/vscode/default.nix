{ config, pkgs, settings, lib, extensions, ...}:

{
  environment.systemPackages = with pkgs; [
    vscodium
  ];

  programs.direnv.enable = true;
  home-manager.users.${settings.userName} = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;  # Use VSCodium as the VSCode package
      extensions = with extensions.vscode-marketplace; [
        jnoortheen.nix-ide
        vscodevim.vim
      ];
      userSettings = {
        # Editor Settigns
          "editor.cursorBlinking"= "phase";
          "editor.cursorSmoothCaretAnimation"= "on";
          "editor.fontFamily"= "'Hack Nerd Font'";
          "editor.smoothScrolling"= "true";
          "terminal.integrated.fontFamily"= "'Hack Nerd Font'";
          "terminal.integrated.smoothScrolling"= "true";
          "window.titleBarStyle"= "custom";
          "window.menuBarVisibility"= "compact";
          "workbench.sideBar.location" = "right";
          "editor.renderControlCharacters" = false;
          "workbench.editor.showTabs" = "none";
          "editor.stickyScroll.enabled" = false;

        # Scrollbar Settings
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "editor.minimap.enabled" = false;

        # Theme
          "workbench.list.smoothScrolling"= "true";
          "workbench.colorCustomizations" = {
            "[Stylix]" = {
              "sideBar.background"= lib.mkForce "#${config.lib.stylix.colors.base00}";
              "activityBar.background"= lib.mkForce "#${config.lib.stylix.colors.base00}";
              "tab.inactiveBackground"= lib.mkForce "#${config.lib.stylix.colors.base00}";
              "editorGroupHeader.tabsBackground"= lib.mkForce "#${config.lib.stylix.colors.base00}";
              "tree.indentGuidesStroke" = lib.mkForce "#${config.lib.stylix.colors.base00}";
              "statusBar.background" = lib.mkForce "#${config.lib.stylix.colors.base00}";
              "editorTitle.background" = lib.mkForce "#${config.lib.stylix.colors.base00}";
              "statusBarItem.remoteBackground" = lib.mkForce "#${config.lib.stylix.colors.base00}";
              "dropdown.listBackground" = lib.mkForce "#${config.lib.stylix.colors.base00}";
              "titleBar.inactiveBackground" = lib.mkForce "#${config.lib.stylix.colors.base00}";
              "breadcrumb.background" = lib.mkForce "#${config.lib.stylix.colors.base00}";
              "sideBarSectionHeader.background" = lib.mkForce "#${config.lib.stylix.colors.base00}";
            };
          };
          
        # Keybinds
        "vim.useCtrlKeys"= false;
      };
    };
    stylix.targets.vscode.enable = true;
  };
}