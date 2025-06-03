{
  settings,
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
            --zen-themed-toolbar-bg-transparent: #${config.lib.stylix.colors.base00}${dotlib.decToHex settings.opacity} !important;
            --zen-blur-radius: 10px;
            --zen-blur-transition-duration: 0.4s;
            --zen-blur-transition-timing: cubic-bezier(0.22, 1, 0.36, 1);
          }

          #browser:has(#urlbar[open][zen-floating-urlbar="true"]) #tabbrowser-tabpanels,
          #browser:has(#urlbar[open][zen-floating-urlbar="true"]) #tabbrowser-tabpanels > hbox {
              pointer-events: none;
              filter: blur(var(--zen-blur-radius)) brightness(100%) !important;
              transition:
                  filter var(--zen-blur-transition-duration) var(--zen-blur-transition-timing),
                  opacity var(--zen-blur-transition-duration) ease !important;
          }

          #browser:not(:has(#urlbar[open][zen-floating-urlbar="true"])) #tabbrowser-tabpanels,
          #browser:not(:has(#urlbar[open][zen-floating-urlbar="true"])) #tabbrowser-tabpanels > hbox {
              filter: blur(0) brightness(100%) !important;
              transition:
                  filter var(--zen-blur-transition-duration) var(--zen-blur-transition-timing),
                  opacity var(--zen-blur-transition-duration) ease !important;
          }

          #urlbar[open][zen-floating-urlbar="true"] #urlbar-background {
              border-radius: 1em !important;
              background-color: transparent !important;
              box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2) !important;
              transition: all 0.3s ease !important;
          }

          toolbaritem#urlbar-container * {
              border: none !important;
          }

          #tabbrowser-tabpanels
              > hbox:not([zen-split="true"]):not(:has(.zen-glance-background)) {
              transition:
                  all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.35),
                  filter var(--zen-blur-transition-duration) ease-in-out,
                  opacity 0.35s ease-in-out !important;
              scale: 0.9 !important;
              opacity: 0;
          }

          #tabbrowser-tabpanels > hbox.deck-selected:not([zen-split="true"]) {
              scale: 1 !important;
              opacity: 1 !important;
          }

          #urlbar:not([open]) {
              transition: all 0.3s ease !important;
          }

          #urlbar[open][zen-floating-urlbar="true"] .urlbar-input {
              color: white !important;
              text-shadow: 0 1px 2px rgba(0, 0, 0, 0.5) !important;
          }

          #urlbar[open] > #urlbar-background,
          #urlbar[open] > .urlbarView {
              border: none !important;
              box-shadow: none !important;
              outline: none !important;
          }        '';
      };
    };
  };
}
