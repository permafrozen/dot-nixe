{ config, settings, ... }:

{

  nix.settings = {
    substituters =
      [ "https://walker-git.cachix.org" "https://walker.cachix.org" ];
    trusted-public-keys = [
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
    ];
  };

  home-manager.users.${settings.userName} = {
    programs.walker = {
      enable = true;
      runAsService = true;

      # All options from the config.json can be used here.
      config = {
        search.placeholder = "Search";
        ui.fullscreen = true;
        list = { height = 200; };
        websearch.prefix = "?";
        switcher.prefix = "/";
        theme = "home-manager";
      };

      theme = {
        layout = {

          "ui" = {
            "anchors" = {
              "bottom" = true;
              "left" = true;
              "right" = true;
              "top" = true;
            };
            "window" = {
              "box" = {
                "ai_scroll" = {
                  "h_align" = "fill";
                  "height" = 300;
                  "list" = {
                    "item" = {
                      "h_align" = "fill";
                      "name" = "aiItem";
                      "v_align" = "fill";
                      "wrap" = true;
                      "x_align" = 0;
                      "y_align" = 0;
                    };
                    "name" = "aiList";
                    "orientation" = "vertical";
                    "spacing" = 10;
                    "width" = 400;
                  };
                  "margins" = { "top" = 8; };
                  "max_height" = 300;
                  "min_width" = 400;
                  "name" = "aiScroll";
                  "v_align" = "fill";
                  "width" = 400;
                };
                "bar" = {
                  "entry" = {
                    "h_align" = "fill";
                    "h_expand" = true;
                    "icon" = {
                      "h_align" = "center";
                      "h_expand" = true;
                      "pixel_size" = 24;
                      "theme" = "Papirus";
                    };
                  };
                  "orientation" = "horizontal";
                  "position" = "end";
                };
                "h_align" = "center";
                "margins" = { "top" = 200; };
                "scroll" = {
                  "list" = {
                    "item" = {
                      "activation_label" = {
                        "h_align" = "fill";
                        "v_align" = "fill";
                        "width" = 20;
                        "x_align" = 0.5;
                        "y_align" = 0.5;
                      };
                      "icon" = {
                        "pixel_size" = 26;
                        "theme" = "Papirus";
                      };
                    };
                    "margins" = { "top" = 8; };
                    "max_height" = 300;
                    "max_width" = 400;
                    "min_width" = 400;
                    "width" = 400;
                  };
                };
                "search" = {
                  "input" = {
                    "h_align" = "fill";
                    "h_expand" = true;
                    "icons" = true;
                  };
                  "spinner" = { "hide" = true; };
                };
                "width" = 450;
              };
              "h_align" = "fill";
              "v_align" = "fill";
            };
          };
        };

        style = ''
          :root {
            --main-background: #${config.lib.stylix.colors.base00}80;
            background-color: #${config.lib.stylix.colors.base00}80;
            --main-color: #${config.lib.stylix.colors.base05};
            --main-border-color: #${config.lib.stylix.colors.base0D};
            --search-background: #${config.lib.stylix.colors.base00};
            --search-icon-color: #${config.lib.stylix.colors.base05};
            --typeahead-color: ${config.lib.stylix.colors.base04};
            --selected-background: ${config.lib.stylix.colors.base01};
            --ai-color: ${config.lib.stylix.colors.base06};
            --ai-response-background: ${config.lib.stylix.colors.base00};
          }

          #window,
          #box,
          #aiScroll,
          #aiList,
          #search,
          #password,
          #input,
          #typeahead,
          #list,
          child,
          scrollbar,
          slider,
          #item,
          #text,
          #label,
          #bar,
          #sub,
          #activationlabel {
            all: unset;
          }

          #window {
            color: #${config.lib.stylix.colors.base05};
          }

          #box {
            border-radius: 10px;
            background-color: #${config.lib.stylix.colors.base00}80;
            padding: 32px;
            border: 2px solid #${config.lib.stylix.colors.base0D};

          }

          #password,
          #input,
          #typeahead {
            padding: 8px;
            padding-top: 4px;
            padding-bottom: 4px;
            border-radius: 2px;
          }

          #input {
            background: none;
          }

          #password {
          }

          #spinner {
            padding: 8px;
          }

          #typeahead {
            color: var(--typeahead-color);
          }

          #input placeholder {
            /* opacity: 0.5; */
          }

          #input > *:first-child,
          #typeahead > *:first-child {
            margin-right: 16px;
            margin-left: 4px;
            color: var(--search-icon-color);
            /* opacity: 0.2; */
          }

          #input > *:last-child,
          #typeahead > *:last-child {
            color: var(--search-icon-color);
            /* opacity: 0.8; */
          }

          #list {
          }

          child {
            padding: 9px;
            border-radius: 10px;
          }

          #item {
          }

          #icon {
            margin-right: 8px;
          }

          #text {
          }

          #label {
            font-weight: 500;
          }

          #sub {
            */ opacity: 0.5; */
            font-size: 0.8em;
          }

          #activationlabel {
          }

          #bar {
          }

          .barentry {
          }

          .activation #activationlabel {
          }

          .activation #text,
          .activation #icon,
          .activation #search {
            /* opacity: 0.5; */
          }

          .aiItem {
            padding: 10px;
            border-radius: 2px;
            color: var(--ai-color);
          }

          .aiItem.user {
            background: none;
            padding-left: 0;
            padding-right: 0;
          }

          .aiItem.assistant {
            background: var(--ai-response-background);
        '';
      };
    };
  };
}
