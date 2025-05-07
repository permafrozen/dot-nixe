<div align="center">
  <pre>
    ██████╗  ██████╗ ████████╗   ███╗   ██╗██╗██╗  ██╗███████╗
    ██╔══██╗██╔═══██╗╚══██╔══╝   ████╗  ██║██║╚██╗██╔╝██╔════╝
    ██║  ██║██║   ██║   ██║█████╗██╔██╗ ██║██║ ╚███╔╝ █████╗
    ██║  ██║██║   ██║   ██║╚════╝██║╚██╗██║██║ ██╔██╗ ██╔══╝
    ██████╔╝╚██████╔╝   ██║      ██║ ╚████║██║██╔╝ ██╗███████╗
    ╚═════╝  ╚═════╝    ╚═╝      ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚══════╝
  </pre>
</div>

## Table of Contents
- [About](#about)
- [Documentation](#documentation)
- [License](#license)

## About

This is my NixOS configuration utilising `flakes` and `home-manager` for a reproducible system. It contains configurations for packages in `configs/pkgs/<name>/` wich can be chosen per host. Host presets are stored in `hosts/<name>/`. For a showcase and more information look at the documentation.

## Documentation

TODO

## Devenv

**TODO (Secrets Management)**

For more gh api create a new token with no extra permissions at https://github.com/settings/personal-access-tokens/new. Add the token to your `~/.config/nix/nix.conf`:
```ini
access-tokens = github.com=<GITHUB_TOKEN>
```

## License
MIT License
