{ inputs, settings, ... }: {

  home-manager.users.${settings.userName} = {
    imports = [ inputs.lazyvim.homeManagerModules.default ];
    programs.lazyvim = {
      enable = true;
      extras = {
        coding = { yanky.enable = true; };

        editor = {
          dial.enable = true;
          inc-rename.enable = true;
        };

        lang = {
          nix.enable = true;
          astro.enable = true;
          go.enable = true;
          json.enable = true;
          markdown.enable = true;
          python.enable = true;
          svelte.enable = true;
          tailwind.enable = true;
          typescript.enable = true;
          zig.enable = true;
        };

        test = { core.enable = true; };

        util = {
          dot.enable = true;
          mini-hipatterns.enable = true;
        };
      };
    };
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
  };

}
