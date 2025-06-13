{ inputs, ... }:

{
  # astal config from remote flake
  environment.systemPackages = [ inputs.aglet.packages.x86_64-linux.default ];

  # dependencies
  services.upower.enable = true;
}
