{
  settings,
  lib,
  dotlib,
  config,
  inputs,
  pkgs,
  ...
}:
{

  home-manager.users.${settings.userName} = {
    imports = [ inputs.zen-browser.homeModules.beta ];
    programs.zen-browser = {
      enable = true;

      policies = {
        DisableAppUpdate = true;
        DisablePocket = true;
        DisableMasterPasswordCreation = true;
        DisableFirefoxStudies = true;
        DisableFirefoxAccounts = true;
        DisableTelemetry = true;
        DisableProfileImport = true;
        DisableSetDesktopBackground = true;
        DisplayBookmarksToolbar = "never";
        OfferToSaveLogins = false;

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
      };

      profiles."default" = {
        name = "${settings.userName}";
        id = 0;
        isDefault = true;

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          privacy-badger
          sponsorblock
          ublock-origin
          bitwarden
          wikiwand-wikipedia-modernized
        ];

        settings = {
          "extensions.autoDisableScopes" = 0;
          "browser.aboutConfig.showWarning" = false;
          "devtools.debugger.remote-enabled" = true;
          "devtools.chrome.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.tabs.allow_transparent_browser" = true;
          "zen.widget.linux.transparency" = true;
          "gfx.webrender.all" = true;
          "zen.view.grey-out-inactive-windows" = false;
          "signon.rememberSignons" = false;
          "browser.translations.automaticallyPopup" = false;
          "zen.workspaces.force-container-workspace" = true;
          "browser.download.lastDir" = "/home/matteo/downloads";
          "zen.welcome-screen.seen" = true;
        };

        search.engines = {
          "Nix Packages" = {
            urls = [
              {
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
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "NixOS Wiki" = {
            urls = [ { template = "https://wiki.nixos.org/index.php?search={searchTerms}"; } ];
            icon = "https://wiki.nixos.org/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@nw" ];
          };

          "Perplexity" = {
            urls = [ { template = "https://www.perplexity.ai/search/?q={searchTerms}"; } ];
            icon = "https://www.perplexity.ai/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@pp" ];
          };

          "MyNixOS" = {
            urls = [ { template = "https://mynixos.com/search?q={searchTerms}"; } ];
            icon = "https://mynixos.com/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@my" ];
          };

          "GitHub" = {
            urls = [ { template = "https://github.com/search?q={searchTerms}&type=repositories"; } ];
            icon = "https://github.com/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@gh" ];
          };

          "youtube" = {
            urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
            icon = "https://www.youtube.com/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@yt" ];
          };

          "bing".metaData.hidden = true;
          "google".metaData.alias = "@go"; # builtin engines only support specifying one additional alias
          "ddg".metaData.alias = "@ddg"; # ^
        };

        userChrome = ''
          :root {
            --zen-themed-toolbar-bg-transparent: #${config.lib.stylix.colors.base00}${
              dotlib.decToHex (lib.strings.floatToString (builtins.fromJSON settings.opacity / 2))
            } !important;
            --solid: #${config.lib.stylix.colors.base00} !important;
          }

          @keyframes in {
              0% {
                  transform: translateY(-50%) translateX(-50%);
                  opacity: 0;
              }
              100% {
                  transform: translateY(0%) translateX(-50%);
                  opacity: 1;
              }
          }

          #urlbar[open][zen-floating-urlbar="true"] {
              pointer-events: none;
              animation: in 0.3s ease forwards;
          }


          #urlbar[open][zen-floating-urlbar="true"] #urlbar-background {
              background-color: var(--solid) !important;
              box-shadow: none;
          }

          tabbox#tabbrowser-tabbox {
              background-color: #fff;
              border-radius: calc(var(--zen-native-inner-radius) + 1px);
          }
        '';
      };
    };
  };
}
