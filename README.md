<h1 align="center">dot-nixe</h1>
<div align="center">Flake-based, reproducible NixOS configuration</div>

<br><br>

## Table of Content

<!--toc:start-->
- [About](#about)
- [Documentation](#documentation)
- [License](#license)
<!--toc:end-->

## About

This is a `NixOS` configuration utilizing `flakes` and `home-manager` for a reproducible system. It contains configurations for packages in `configs/pkgs/<name>/` which can be chosen per host. Host presets are stored in `hosts/<name>/`. For a showcase and more information look at the documentation.

## Documentation

### Installation

> [!IMPORTANT]
> If you install this config on a VM, make sure to enable `hardware-acceleration`. Also, change the GRUB boot settings to use the appropriate device, e.g., `"/dev/sda"`.

1. Add experimental features to `configuration.nix`:
    ```nix
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    ```

2. Rebuild your system to apply changes:
    ```console
    sudo nixos-rebuild switch
    ```

3. Clone the repository (in ~):
    ```console
    git clone https://github.com/Permafrozen/dot-nixe .dot-nixe
    ```

4. Copy your `/etc/nixos/hardware-configuration.nix` to the host you want to use (the default host is `laptop`):
    ```console
    cp /etc/nixos/hardware-configuration.nix ~/.dot-nixe/hosts/laptop
    ```

5. Rebuild with the flake *(inside the dot-nixe directory)*:
    ```console
    sudo nixos-rebuild switch --flake .
    ```

### Usage

#### Rebuilding with `nh`

<div class="warning">

Remeber to be inside the same directory if you use `.`

</div>

```console
nh os switch .
```

#### Rebuilding without `nh`


<div class="warning">

Remeber to be inside the same directory if you use `.`

</div>

```console
sudo nixos-rebuild switch --flake .
```

#### Updating your flake

<div class="warning">

You have to rebuild to use the updated configuration.

</div>

```console
nix flake update
```

You can also update only single Inputs for example:
```console
nix flake update <my-flake-input>
```

## License

[MIT License](./LICENSE)

<br>

<div align="center"><br>
  <pre>
▓█████▄  ▒█████  ▄▄▄█████▓ ███▄    █  ██▓▒██   ██▒▓█████
▒██▀ ██▌▒██▒  ██▒▓  ██▒ ▓▒ ██ ▀█   █ ▓██▒▒▒ █ █ ▒░▓█   ▀
░██   █▌▒██░  ██▒▒ ▓██░ ▒░▓██  ▀█ ██▒▒██▒░░  █   ░▒███
░▓█▄   ▌▒██   ██░░ ▓██▓ ░ ▓██▒  ▐▌██▒░██░ ░ █ █ ▒ ▒▓█  ▄
░▒████▓ ░ ████▓▒░  ▒██▒ ░ ▒██░   ▓██░░██░▒██▒ ▒██▒░▒████▒
 ▒▒▓  ▒ ░ ▒░▒░▒░   ▒ ░░   ░ ▒░   ▒ ▒ ░▓  ▒▒ ░ ░▓ ░░░ ▒░ ░
 ░ ▒  ▒   ░ ▒ ▒░     ░    ░ ░░   ░ ▒░ ▒ ░░░   ░▒ ░ ░ ░  ░
 ░ ░  ░ ░ ░ ░ ▒    ░         ░   ░ ░  ▒ ░ ░    ░     ░
   ░        ░ ░                    ░  ░   ░    ░     ░  ░
 ░
  </pre>
</div>
