{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [ fastfetch ];

  home-manager.users.${settings.userName} = {
    programs.fastfetch = {
      enable = true;
      package = pkgs.fastfetch;
      settings = {
        logo = {
          source = ../../../. + "/assets/ascii/frieren.txt";
          position = "left";
          padding = {
            top = 0;
            left = 2;
            right = 4;
          };
        };

        display = {
          separator = "  ";
        };

        modules = [
          {
            type = "title";
            format = "{#1}{#}{user-name-colored}";
          }
          {
            type = "os";
            key = "{#separator}{#keys} ├─ 󰍹 OS";
          }
          {
            type = "kernel";
            key = "{#separator}{#keys} ├─ 󰒋 Kernel";
          }
          {
            type = "packages";
            key = "{#separator}{#keys} ├─ 󰏖 Packages";
            format = "{all}";
          }
          {
            type = "de";
            key = "{#separator}{#keys} ├─ 󰧨 DE";
          }
          {
            type = "wm";
            key = "{#separator}{#keys} ├─ 󱂬 WM";
          }
          {
            type = "display";
            key = "{#separator}{#keys} ├─ 󰹑 Resolution";
          }
          {
            type = "shell";
            key = "{#separator}{#keys} ├─ 󰞷 Shell";
          }
          {
            type = "terminalfont";
            key = "{#separator}{#keys} ├─ 󰛖 Font";
          }
          {
            type = "cpu";
            key = "{#separator}{#keys} ├─ 󰻠 CPU";
          }
          {
            type = "gpu";
            key = "{#separator}{#keys} ├─ 󰢮 GPU";
          }
          {
            type = "memory";
            key = "{#separator}{#keys} ├─ 󰍛 Memory";
          }
          {
            type = "disk";
            key = "{#separator}{#keys} ╰─ 󰋊 Disk (/)";
            folders = "/";
          }
        ];
      };
    };
  };
}
