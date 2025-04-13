{ dotlib, config, settings, pkgs, ... }: {
  home-manager.users.${settings.userName} = {
    # *Theme*
    # https://github.com/datguypiko/Firefox-Mod-Blur
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/fetchzip/default.nix
    # home.file.librewolf = {
    #     target = ".librewolf/default/chrome";
    #     source = pkgs.fetchzip {
    #         url = "https://github.com/datguypiko/Firefox-Mod-Blur/releases/download/v2.15.1/v2.15.1_ModBlur-Firefox_v136.zip";
    #         hash = "sha256-HofaOJpmOdTcJq0gw4jP1UZ6eBE8wtxf052VD5T5EC4=";
    #         stripRoot = false;
    #     };
    # };

    programs.librewolf = {
      enable = true;
      package = pkgs.librewolf;
      languagePacks = [ "en-GB" "de" ];

      # Librewolf Overrides (about:config; ...)
      settings = {
        "privacy.resistFingerprinting" = false;
        "svg.context-properties.content.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.allow_transparent_browser" = true;
        "webgl.disabled" = false;
      };

      # Policies
      policies = {
        AppAutoUpdate = false;
        DisablePocket = true;
        DisableMasterPasswordCreation = true;
        DisableFirefoxStudies = true;
        DisableFirefoxAccounts = true;
        DisableTelemetry = true;
        DisableProfileImport = true;
        DisableSetDesktopBackground = true;
        DisplayBookmarksToolbar = "never";
        OfferToSaveLogins = false;

        # Container Configuration
        Containers = {
          Default = [
            {
              name = "chilling";
              icon = "vacation";
              color = "toolbar";
            }

            {
              name = "school";
              icon = "briefcase";
              color = "toolbar";
            }

            {
              name = "linux";
              icon = "gift";
              color = "toolbar";
            }
          ];
        };

        # Autoinstalled Extensions
        # https://mozilla.github.io/policy-templates/#extensionsettings
        ExtensionSettings = {
          "*".installation_mode = "blocked";

          "uBlock0@raymondhill.net" = {
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };

          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url =
              "https://addons.mozilla.org/en-US/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
          };

          "sponsorBlocker@ajay.app" = {
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "force_installed";
          };

          "jid1-D7momAzRw417Ag@jetpack" = {
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/wikiwand-wikipedia-modernized/latest.xpi";
            installation_mode = "force_installed";
          };

          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };

          "queryamoid@kaply.com" = {
            install_url =
              "https://github.com/mkaply/queryamoid/releases/download/v0.1/query_amo_addon_id-0.1-fx.xpi";
            installation_mode = "force_installed";
          };
        };
      };

      # Default Profile Configuration
      profiles.default = {
        name = "${settings.userName}";
        id = 0;
        isDefault = true;

        # userChrome = "\n";
        # userContent = "\n";

        search.engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }];

            icon =
              "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nixp" ];
          };

          "NixOS Wiki" = {
            urls = [{
              template =
                "https://wiki.nixos.org/index.php?search={searchTerms}";
            }];
            iconUpdateURL = "https://wiki.nixos.org/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@nixw" ];
          };

          "Perplexity" = {
            urls = [{
              template = "https://www.perplexity.ai/search/?q=%s{searchTerms}";
            }];
            iconUpdateURL = "https://www.perplexity.ai/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@per" ];
          };

          "Bing".metaData.hidden = true;
          "Google".metaData.alias =
            "@goo"; # builtin engines only support specifying one additional alias
          "DuckDuckGo".metaData.alias =
            "@duck"; # builtin engines only support specifying one additional alias
        };
        userChrome = ''
          :root {
              --main-bg: #${config.lib.stylix.colors.base00}${
                dotlib.decToHex settings.opacity
              };
          }

          toolbox#navigator-toolbox.browser-toolbox-background {
            background-color: var(--main-bg) !important;
          }

           tab.tabbrowser-tab {
            background-color: var(--main-bg) !important;
            margin: 0 10px 0 10px !important;
            border-radius: 100px !important;
          }

          .tab-background:is([selected], [multiselected]) {
              background-color: var(--main-bg) !important;
              background-image: none !important;

          }

          .tab-text {

          }

          toolbarbutton.titlebar-button.titlebar-close,
          toolbarbutton#firefox-view-button.chromeclass-toolbar-additional,
          .titlebar-spacer{
            display: none;
          }

          toolbar {
             background-color: #00000000 !important;
          }

          #nav-bar {
            border: none !important;
          }
        '';
      };
    };
  };
}
