{ config, ... }:

{
  environment.sessionVariables = { MANPAGER = "nvim +Man!"; };
  programs.nixvim = {
    enable = true;

    # Plugins
    plugins = {
      transparent = {
        enable = true;
        settings = { enable = true; };
      };

      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
            settings = { formatting.command = [ "nix-fmt" ]; };
          };
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources =
          [ { name = "nvim_lsp"; } { name = "path"; } { name = "buffer"; } ];
      };
    };

    extraConfigVim = ''
      augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:ver20
      augroup END
    '';

    globals = { transparent_enabled = "v:true"; };

    # Base16 color scheme
    colorschemes.base16 = {
      enable = true;
      colorscheme = {
        base00 = "#${config.lib.stylix.colors.base00}";
        base01 = "#${config.lib.stylix.colors.base01}";
        base02 = "#${config.lib.stylix.colors.base02}";
        base03 = "#${config.lib.stylix.colors.base03}";
        base04 = "#${config.lib.stylix.colors.base04}";
        base05 = "#${config.lib.stylix.colors.base05}";
        base06 = "#${config.lib.stylix.colors.base06}";
        base07 = "#${config.lib.stylix.colors.base07}";
        base08 = "#${config.lib.stylix.colors.base08}";
        base09 = "#${config.lib.stylix.colors.base09}";
        base0A = "#${config.lib.stylix.colors.base0A}";
        base0B = "#${config.lib.stylix.colors.base0B}";
        base0C = "#${config.lib.stylix.colors.base0C}";
        base0D = "#${config.lib.stylix.colors.base0D}";
        base0E = "#${config.lib.stylix.colors.base0E}";
        base0F = "#${config.lib.stylix.colors.base0F}";
      };
    };
  };
}
