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

        userContent = ''
          @-moz-document url-prefix("http://"), url-prefix("https://") {
            body {
              background-color: #fff; 
            }

            @-moz-document domain(reddit.com), domain(nixos.org) {
              html, body { background-color: initial ; }
            }
          }
        '';

        # Inspiration from: https://github.com/sameerasw/zen-themes/blob/main/TransparentZen/chrome.css
        userChrome = ''
                    :root {            
                      --zen-themed-toolbar-bg-transparent: #${config.lib.stylix.colors.base00}${
                        dotlib.decToHex (lib.strings.floatToString (builtins.fromJSON settings.opacity / 2))
                      } !important;
                      --zen-border-radius: 5px;
                    }

                    tabbox#tabbrowser-tabbox *{
                        background-color: transparent !important;
                    }

                    @-moz-document url-prefix("chrome:") {
                      #urlbar[breakout-extend="true"] #urlbar-background {
                        background-color: #${config.lib.stylix.colors.base00}${dotlib.decToHex settings.opacity} !important;
                        border-radius: var(--zen-border-radius) !important;
                        border: solid 3px #${config.lib.stylix.colors.base05}${dotlib.decToHex settings.opacity}!important;
                        backdrop-filter: blur(10px) !important;
                      }
                      
                      .urlbarView-row {
                        &[selected] {
                          background-color: transparent !important;
                        }
                        border-radius: var(--zen-border-radius) !important;
                      }

                      .urlbarView-body-inner {
                        border: none !important;
                      }
                      
                       .browserStack browser {
                        transform: translateX(0) !important;
                      }
                    }
                    hbox.browserSidebarContainer {
             box-shadow: none !important;
          }

          #browser:has([zen-empty-tab="true"][selected="true"]) box#zen-browser-background::after {
              background-image: url("https://raw.githubusercontent.com/zen-browser/branding/refs/heads/main/Official/Word%20Marks/SVG/zen_logo_icon_white.svg") !important;
              background-position: center !important;
              background-repeat: no-repeat !important;
              background-size: 150px !important;
              @media (prefers-color-scheme: light) {
                filter: saturate(0) invert(1) !important;
              }
            }
          }
        '';
      };
    };
  };
}
