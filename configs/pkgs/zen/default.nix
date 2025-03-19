{ settings, lib, config, inputs, pkgs, ... }:
let
  cfg = { enable = true; }; # config.my.home.features.zen-browser;
  applicationName = "Zen Browser";
  modulePath = [ "programs" "zen-browser" ];
  mkFirefoxModule = import
    "${inputs.home-manager.outPath}/modules/programs/firefox/mkFirefoxModule.nix";

  decToHex = decimalString:
    let
      decimal = builtins.fromJSON decimalString;
      integer = lib.strings.toInt (toString (builtins.floor (decimal * 255)));
      hex = lib.trivial.toHexString integer;
    in if (lib.stringLength hex) == 1 then "0${hex}" else hex;
in {
  home-manager.users.${settings.userName} = {

    imports = [
      (mkFirefoxModule {
        inherit modulePath;
        name = applicationName;
        wrappedPackageName = "zen-browser-unwrapped";
        unwrappedPackageName = "zen-browser";
        visible = true;
        platforms = {
          linux = {
            vendorPath = ".zen";
            configPath = ".zen";
          };
          darwin = { configPath = "Library/Application Support/Zen"; };
        };
      })
    ];

    options.my.home.features.zen-browser = { enable = lib.mkEnableOption ""; };

    config = lib.mkIf cfg.enable {
      programs.zen-browser = {
        enable = true;
        package = pkgs.wrapFirefox
          (inputs.zen-browser.packages.${pkgs.system}.default.overrideAttrs
            (prevAttrs: {
              passthru = prevAttrs.passthru or { } // {
                inherit applicationName;
                binaryName = "zen";

                ffmpegSupport = true;
                gssSupport = true;
                gtk3 = pkgs.gtk3;
              };

            })) {
              icon = "zen-beta";
              wmClass = "zen";
              hasMozSystemDirPatch = false;
            };

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
            "gfx.webrender.all" = true;
            "zen.view.grey-out-inactive-windows" = false;
            "signon.rememberSignons" = false;
            "browser.translations.automaticallyPopup" = false;
            "zen.workspaces.force-container-workspace" = true;
            "browser.download.lastDir" = "/home/matteo/downloads";
          };

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

            "Perplexity" = {
              urls = [{
                template = "https://www.perplexity.ai/search/?q={searchTerms}";
              }];
              iconUpdateURL = "https://www.perplexity.ai/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@pp" ];
            };

            "MyNixOS" = {
              urls =
                [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
              iconUpdateURL = "https://mynixos.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@my" ];
            };

            "GitHub" = {
              urls = [{
                template =
                  "https://github.com/search?q={searchTerms}&type=repositories";
              }];
              iconUpdateURL = "https://github.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@gh" ];
            };

            "YouTube" = {
              urls = [{
                template =
                  "https://www.youtube.com/results?search_query={searchTerms}";
              }];
              iconUpdateURL = "https://www.youtube.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@yt" ];
            };

            "Bing".metaData.hidden = true;
            "Google".metaData.alias =
              "@go"; # builtin engines only support specifying one additional alias
            "DuckDuckGo".metaData.alias = "@dd"; # ^
          };
          userChrome = ''
            :root {
                --main-bg: #${config.lib.stylix.colors.base00}${
                  decToHex settings.opacity
                }
            }
            toolbox#navigator-toolbox.browser-toolbox-background {
              background-color: transparent !important;
            }

            hbox#browser {
                background-color: var(--main-bg) !important;
            }
          '';
        };
      };
    };
  };
}
