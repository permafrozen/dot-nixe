{ config, settings, pkgs, ... }: {
  home-manager.users.${settings.userName} = {
    programs.floorp = {
      enable = true;
      profiles.default = {
        settings = {
          "extensions.autoDisableScopes" = 0;
          "browser.aboutConfig.showWarning" = false;
          "browser.bookmarks.addedImportButton" = false;
          "browser.toolbars.bookmarks.visibility" = "newtab";
          "browser.tabs.warnOnClose" = false;
          # "browser.startup.homepage" = "https://nixos.org";
          # "browser.search.region" = "GB";
          # "browser.search.isUS" = false;
          # "distribution.searchplugins.defaultLocale" = "en-GB";
          # "general.useragent.locale" = "en-GB";
          # "browser.bookmarks.showMobileBookmarks" = true;
          # "browser.newtabpage.pinned" = [{
          #   title = "NixOS";
          #   url = "https://nixos.org";
          # }];
        };

        extensions = with config.nur.repos.rycee.firefox-addons; [
          privacy-badger
          sponsorblock
          ublock-origin
          bitwarden
          wikiwand-wikipedia-modernized
          terms-of-service-didnt-read
        ];

        bookmarks = [{
          name = "HTL-Wels Seiten";
          toolbar = true;
          bookmarks = [
            {
              name = "moodle";
              url = "http://elearn.htl-wels.at/";
            }
            {
              name = "webdav";
              url = "https://webdav.htl-wels.at:4343/Lehrer/Lehrer/";
            }
            {
              name = "digi4school";
              url = "https://digi4school.at/";
            }
            {
              name = "webuntis";
              url = "https://hypate.webuntis.com/today";
            }
          ];
        }];

        search = {
          default = "DuckDuckGo";
          engines = {
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
              definedAliases = [ "@np" ];
            };

            "NixOS Wiki" = {
              urls = [{
                template =
                  "https://wiki.nixos.org/index.php?search={searchTerms}";
              }];
              iconUpdateURL = "https://wiki.nixos.org/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };

            "Perplexity ai" = {
              urls =
                [{ template = "https://www.perplexity.ai/?q={searchTerms}"; }];
              definedAliases = [ "@pe" ];
            };

            "My NixOS" = {
              urls =
                [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
              definedAliases = [ "@my" ];
            };

            "Bing".metaData.hidden = true;
            "Google".metaData.alias =
              "@g"; # builtin engines only support specifying one additional alias
          };
        };
      };
    };
  };
}
