{ settings, pkgs, ... }: {
  home-manager.users.${settings.userName} = {
    programs.librewolf = {
      enable = true;
      package = pkgs.librewolf-wayland;
      languagePacks = [ "en-GB" "de" ];

      # Policies
      policies = {
        AppAutoUpdate = true;
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
        Extensions = {
          Install = [
            "https://addons.mozilla.org/firefox/downloads/somefile.xpi"
            "//path/to/xpi"
          ];
          Uninstall = [ "bad_addon_id@mozilla.org" ];
          Locked = [ "addon_id@mozilla.org" ];
        };

        # Search Engines
        SearchEngines = {
          Add = [
            {
              Name = "Google";
              URLTemplate = "https://www.google.com/search?q=";
              Method = "GET";
              IconURL = "https://www.example.org/favicon.ico";
              Alias = "example";
              Description = "Description";
              PostData = "search?q={searchTerms}";
              SuggestURLTemplate =
                "https://www.google.com/search?q={searchTerm}";
            }

            {
              Name = "Perplexity";
              URLTemplate =
                "https://www.perplexity.ai/search/?q=%s{searchTerms}";
              Method = "GET";
              IconURL = "https://www.example.org/favicon.ico";
              Alias = "pe";
              Description = "Description";
              PostData = "?q=%s{searchTerms}";
              SuggestURLTemplate =
                "https://www.perplexity.ai/search/?q=%s{searchTerms}";
            }
          ];
        };

      };

      settings = {
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;
      };
    };
  };
}
