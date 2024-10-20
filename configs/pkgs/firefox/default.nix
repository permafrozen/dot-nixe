{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    programs.firefox = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "default";
        extensions = with config.nur.repos.rycee.firefox-addons; [
          privacy-badger
          sponsorblock
          sidebery
          ublock-origin
          bitwarden
          wikiwand-wikipedia-modernized
          terms-of-service-didnt-read
        ];
        bookmarks = [
          {
            name = "Nix sites";
            toolbar = true;
            bookmarks = [
              {
                name = "homepage";
                url = "https://nixos.org/";
                tags = [ "nixos" ];
              }
              {
                name = "wiki";
                tags = [ "nixios" "wiki" ];
                url = "https://wiki.nixos.org/";
              }
              {
                name = "mynixos";
                tags = [ "nixos" "search" ];
                url = "https://wiki.nixos.org/";
              }
              {
                name = "discourse";
                tags = [ "nixos" "forum" ];
                url = "https://discourse.nixos.org/";
              }
            ];
          }
        ];
        search.default = "DuckDuckGo";
        settings = {
          # Enable all Extensions
          "extensions.autoDisableScopes" = 0;

          # Enable custom css
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          # Default Page
          "browser.startup.homepage" = "about:newtab";
          "browser.startup.blankWindow" = true;
          "browser.startup.page" = 0; # close all tabs after closing

          # Regional Stuff
          "browser.search.region" = "${settings.searchRegion}";
          "browser.search.isUS" = false;
          "distribution.searchplugins.defaultLocale" = "${settings.locale}";
          "general.useragent.locale" = "${settings.locale}";

          # Stuff I don't like
          "browser.translations.automaticallyPopup" = false;
          "browser.sessionstore.persist_closed_tabs_between_sessions" = false;

          # Bookmarks
          "browser.bookmarks.showMobileBookmarks" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.bookmarks.addedImportButton" = false;

          # disable suggestions
          "browser.urlbar.maxRichResults" = 0;

          # Stuff to disable if using max Rich results
          "browser.urlbar.suggest.searches" = false;
          "browser.urlbar.suggest.trending" = false;
          "browser.urlbar.suggest.recentsearches" = false;
          "browser.urlbar.suggest.history" = true;
          "browser.urlbar.suggest.topsites" = false;
          "browser.urlbar.suggest.bookmark" = false;
          "browser.urlbar.suggest.openpage" = false;
          "browser.urlbar.suggest.engines" = false;
          "browser.urlbar.suggest.addons" = false;
          "browser.urlbar.suggest.mdn" = false;
          "browser.urlbar.suggest.pocket" = false;
          "browser.urlbar.suggest.remotetab" = false;
          "browser.urlbar.suggest.weather" = false;
          "browser.urlbar.suggest.yelp" = false;
          "browser.urlbar.suggest.clipboard" = false;
        };
        userChrome = ''
          html {
            --custom-bg-light: #${config.lib.stylix.colors.base00};
            --custom-bg-dark: #${config.lib.stylix.colors.base00};
            --custom-bg: var(--custom-bg-light);
          }

          @media (prefers-color-scheme: dark) {
            html {
              --custom-bg: var(--custom-bg-dark);
            }
          }

          body {
            background: var(--custom-bg) !important;
          }

          html:not([privatebrowsingmode="temporary"]) #navigator-toolbox {
            padding-top: 3px;
            padding-bottom: 4px;
            background: var(--custom-bg) !important;
            border-bottom: 0 !important;
          }

          #nav-bar {
            background: var(--custom-bg) !important;
          }

          html:not([privatebrowsingmode="temporary"]) #sidebar-box {
            background: var(--custom-bg) !important;
          }

          html:not([privatebrowsingmode="temporary"]) #sidebar-splitter {
            border: none !important;
            background: transparent !important;
            width: 1px !important;
          }

          html:not([privatebrowsingmode="temporary"]) #TabsToolbar {
            visibility: collapse !important;
          }

          #TabsToolbar {
            background: var(--custom-bg) !important;
          }

          html:not([privatebrowsingmode="temporary"]) .titlebar-buttonbox-container {
            position: absolute;
            right: 0;
            top: 9px;
            display: flex;
            justify-content: center;
            width: 110px !important;
          }

          .titlebar-button {
            width: 36px !important;
          }

          html:not([privatebrowsingmode="temporary"]) #nav-bar {
            width: calc(100% - 110px);
          }

          html:not([privatebrowsingmode="temporary"]) #sidebar-header {
            display: none;
          }

          #identity-icon-label {
            display: none;
          }

          #urlbar {
            left: 50% !important;
            transform: translateX(-50%);
            max-width: 960px !important;
          }

           #urlbar-input::placeholder {
            opacity: 0 !important;
          }

          #urlbar:not([breakout-extend]) #urlbar-background {
            background: none !important;
            background-color: transparent !important;
          }

          html:not([privatebrowsingmode="temporary"]) #sidebar-box {
            --uc-sidebar-width: 45px;
            --uc-sidebar-hover-width: 360px;
            --uc-autohide-sidebar-delay-before: 125ms;
            --uc-autohide-sidebar-delay-after: 300ms;
            --uc-autohide-transition-duration: 300ms;
            --uc-autohide-transition-type: ease-in-out;
            position: relative;
            min-width: var(--uc-sidebar-width) !important;
            width: var(--uc-sidebar-width) !important;
            max-width: var(--uc-sidebar-width) !important;
            z-index: 1;
          }

          html:not([privatebrowsingmode="temporary"])
            #main-window[sizemode="fullscreen"]
            #sidebar-box {
            --uc-sidebar-width: 1px;
          }

          html:not([privatebrowsingmode="temporary"]) #sidebar-splitter {
            display: none;
          }

          html:not([privatebrowsingmode="temporary"]) #sidebar {
            transition: all var(--uc-autohide-transition-duration)
              var(--uc-autohide-transition-type) var(--uc-autohide-sidebar-delay-after) !important;
            min-width: var(--uc-sidebar-width) !important;
          }

          html:not([privatebrowsingmode="temporary"]) #sidebar-box:hover > #sidebar {
            min-width: var(--uc-sidebar-hover-width) !important;
            transition-delay: var(--uc-autohide-sidebar-delay-before) !important;
          }

          html:not([privatebrowsingmode="temporary"]) .sidebar-panel {
            background-color: transparent !important;
            color: var(--newtab-text-primary-color) !important;
          }
        '';
        userContent = ''
        :root {
        
        }
         /* General Styles */
          @-moz-document url("about:newtab"), url("about:blank"), url("about:profiles"), url("about:preferences"), url("about:config") {
              body {
                  background-color: #${config.lib.stylix.colors.base00} !important;
                  color: #${config.lib.stylix.colors.base05} !important;
              }
              .search-wrapper, .personalizeButtonWrapper {
                  display: none !important;
              }
          }

          /* DuckDuckGo */
          @-moz-document url("https://duckduckgo.com/") {
            body * {
              background-color: #${config.lib.stylix.colors.base00} !important;
            }
          }
          @-moz-document domain(duckduckgo.com) {
            * {
              border-color: #${config.lib.stylix.colors.base02} !important;
              color: #${config.lib.stylix.colors.base05} !important;
            }

            .search--header {
              background-color: #${config.lib.stylix.colors.base01} !important; 
            }

            .search__autocomplete * {
              background-color: #${config.lib.stylix.colors.base01} !important; 
            }

            .twMgHM3B8cVRU4iN6brN.YjvCRIuul_goVuf1ESim {
              background-color: #${config.lib.stylix.colors.base01} !important;
            }

            .site-wrapper {
              background-color: #${config.lib.stylix.colors.base00} !important;
              
            }
            .header-wrap {
              background-color: #${config.lib.stylix.colors.base00} !important;
            }

            .is-related-search-exp.dark-bg .related-searches__item {
              background-color: #${config.lib.stylix.colors.base01} !important;
            }

            .ffON2NH02oMAcqyoh2UU.hUUdRtuaOUx7mcSwc56s {
              background-color: #${config.lib.stylix.colors.base01} !important;
            }

            .footer, .footer--mobile {
              background-color: #${config.lib.stylix.colors.base00} !important; 
            }

            .O9Ipab51rBntYb0pwOQn {
              background-color: #${config.lib.stylix.colors.base01} !important;
            }

            .search__button:hover,
            .search__button:focus,
            .search--hover .search__button,
            .search--hover .search__button:focus,
            .search--header.has-text.search--hover .search__button,
            .search--header.has-text.search--focus .search__button,
            .search--header.has-text.search--hover .search__button:hover,
            .search--header.has-text.search--focus .search__button:hover,
            .search--home.has-text .search__button,
            .search--home.has-text .search__button:focus,
            .search--home.has-text .search__button:hover {
              background-color:#${config.lib.stylix.colors.base05} !important;
              color: #${config.lib.stylix.colors.base00} !important;
            }

            .DrcPyihFGyKMlg6lpwsa:before,
            .XvPRmQVeIoCP5lQhICTv.ofDl_1VxUG_EKc3b9E3x:before,
            .RHsWhMlxc4ETEMDS9ltw:before,
            .RHsWhMlxc4ETEMDS9ltw:after,
            .header-wrap:after,
            .header__logo-wrap:after,
            .header__logo {
              display: none !important;  
            }

            .header-wrap {
              box-shadow:  0 0 0 #000000 !important;
            }
          }

          

          /* Google Domains 
          @-moz-document domain(google.com.br), domain(google.com) {
              * {
                  background-color: #${config.lib.stylix.colors.base00} !important;
                  border-color: #${config.lib.stylix.colors.base00} !important;
                  color: #${config.lib.stylix.colors.base03} !important;
              }
              span {
                  color: #${config.lib.stylix.colors.base04} !important;
              }
              .RNNXgb {
                  display: none !important;
              }
          }
          */

          /* GitHub Domain */
          @-moz-document domain(github.com) {
            :root {
              --base00: #${config.lib.stylix.colors.base00};
              --base01: #${config.lib.stylix.colors.base01};
              --base02: #${config.lib.stylix.colors.base02};
              --base03: #${config.lib.stylix.colors.base03};
              --base04: #${config.lib.stylix.colors.base04};
              --base05: #${config.lib.stylix.colors.base05};
              --base0D: #${config.lib.stylix.colors.base0D};
            }

            * {
              border-color: var(--base03) !important;
              color: var(--base05) !important;
            }

            .feed-left-sidebar,
            .AppHeader-globalBar,
            .d-md-flex,
            .AppHeader,
            .application-main,
            .rounded-1,
            .d-flex,
            .d-block,
            .px-3,
            .eAZKiL,
            .hdShgm,
            kbd,
            body,
            html,
            .d-none.d-lg-block,
            .js-profile-timeline-year-list.color-bg-default.js-sticky.is-stuck,
            .border-top.color-border-muted.pt-3.mt-3.d-none.d-md-block,
            .js-profile-timeline-year-list.color-bg-default.js-sticky,
            .color-bg-default.pl-2.pr-3,
            .color-bg-default,
            .Overlay-headerContentWrap,
            .List__ListBox-sc-1x7olzq-0.gAwGiF,
            .Overlay.Overlay-whenNarrow.Overlay--size-small-portrait.Overlay--motion-scaleFade.Overlay--placement-left.SidePanel {
              background-color: var(--base00) !important;
            }

            .input-block {
              background-color: var(--base01) !important;
              color: var(--base05) !important;
            }

            .Box-body,
            .box-body .d-flex.flex-justify-between,
            .Box,
            .Box .flex-1,
            .Box .d-flex,
            .markdown-body,
            .highlight,
            .QkQOb,
            .duyuyF,
            .kRIEXD,
            .dJnomT,
            .klSCQM,
            .fJiNYL,
            .hROVzf,
            .cDbgyb,
            .d-none,
            .hQsKGs,
            .drIBIt,
            .btn,
            .rounded-2.py-1 > *,
            .rounded-2.py-1 .rounded-1,
            .rounded-2.py-1 .d-flex,
            .rounded-2.py-1 .d-block,
            .rounded-2 .flex-1,
            .rounded-2 .px-3,
            .d-flex.flex-shrink-0.gap-2,
            .QueryBuilder-StyledInput,
            .d-flex.flex-nowrap.fgColor-muted.f6,
            .pl-lg-3.col-6.border-lg-left,
            .js-activity-overview-graph.mx-auto.d-block,
            .border.py-2.graph-before-activity-overview,
            .border.py-2.graph-before-activity-overview > *,
            .js-calendar-graph *,
            .user-status-circle-badge,
            .user-status-emoji-container,
            .form-control.width-full,
            .topic-tag,
            .Button,
            .FormControl-input,
            .Box-sc-g0xbh4-0.gpHFJV,
            .Box-sc-g0xbh4-0.eoaCFS,
            .Box-sc-g0xbh4-0.jodZGf,
            .Box-sc-g0xbh4-0.cOgqet,
            .segmentedControl-content,
            .AppHeader-searchButton {
              background-color: var(--base01) !important;
            }

            .rounded-2,
            .rounded-top-2 {
              background-color: var(--base01) !important;
            }

            .hSRgxc,
            .Progress-item.rounded-2,
            .js-highlight-blob,
            .activity-overview-point,
            .activity-overview-axis {
              background-color: var(--base0D) !important;
              fill: var(--base0D) !important;
              stroke: var(--base0D) !important;
            }

            }

            .ContributionCalendar-day[data-level="0"] {
              fill: var(--base00) !important;
              background-color: var(--base00) !important;
              outline: 1px solid var(--base01) !important;
            }

            .ContributionCalendar-day[data-level="1"] {
              fill: var(--base01) !important;
              background-color: var(--base01) !important;
              outline: 1px solid var(--base02) !important;
            }

            .ContributionCalendar-day[data-level="2"] {
              fill: var(--base02) !important;
              background-color: var(--base02) !important;
              outline: 1px solid var(--base03) !important;
            }

            .ContributionCalendar-day[data-level="3"] {
              fill: var(--base03) !important;
              background-color: var(--base03) !important;
              outline: 1px solid var(--base04) !important;
            }

            .ContributionCalendar-day[data-level="4"] {
              fill: var(--base04) !important;
              background-color: var(--base04) !important;
              outline: 1px solid var(--base05) !important;
            }
          }
 

          /* Microsoft Teams Domain 
          @-moz-document domain(teams.microsoft.com) {
              * {
                  background-color: #${config.lib.stylix.colors.base00} !important;
                  border-color: #${config.lib.stylix.colors.base00} !important;
                  color: #${config.lib.stylix.colors.base05} !important;
              }
          }
          */

          /* Moodle Domain 
          @-moz-document domain(elearn.htl-wels.at) {
              * {
                  background-color: #${config.lib.stylix.colors.base00} !important;
                  border-color: #${config.lib.stylix.colors.base00} !important;
                  color: #${config.lib.stylix.colors.base05} !important;
              }
          }
          */

          /* Digi4School Domain */
          @-moz-document domain(digi4school.at) {
            * {
              color: #${config.lib.stylix.colors.base05} !important;
            }
            #mainNav, html, input {
                background-color: #${config.lib.stylix.colors.base00} !important;
                border-color: #${config.lib.stylix.colors.base00} !important;
                color: #${config.lib.stylix.colors.base05} !important;
            }
          }

        '';
      };
    };
    stylix.targets.firefox.enable = true;
  };
}