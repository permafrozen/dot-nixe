```ascii
██████╗  ██████╗ ████████╗   ███╗   ██╗██╗██╗  ██╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝   ████╗  ██║██║╚██╗██╔╝██╔════╝
██║  ██║██║   ██║   ██║█████╗██╔██╗ ██║██║ ╚███╔╝ █████╗  
██║  ██║██║   ██║   ██║╚════╝██║╚██╗██║██║ ██╔██╗ ██╔══╝  
██████╔╝╚██████╔╝   ██║      ██║ ╚████║██║██╔╝ ██╗███████╗
╚═════╝  ╚═════╝    ╚═╝      ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚══════╝                                                     
```

# dot-nixe
This is my `nixos` Configuration, built with `flakes` and `home-manager`. I plan a heavy usage of `ags`, for custom widgets (statusbar, applauncher, ect). 

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Showcase](#showcase)
- [Contributing](#contributing)
- [License](#license)

## Installation
> If you install on a VM, make sure to enable `hardware-accelaration`. Also change the grub boot settings to use the according dev, e.g. `"/dev/sda"`.

1. add experimental features to `configuration.nix`:
```nix
 nix.settings.experimental-features = [ "nix-command" "flakes" ];
 ```

2. rebuild your system to apply changes:
```bash
sudo nixos-rebuild switch
```

3. Clone the repository:
```bash
 git clone https://github.com/Permafrozen/dot-nixe
```

4. Copy your `/etc/nixos/hardware-configuration.nix` to the host you want to use, the default host is laptop:
```bash
cp /etc/nixos/hardware-configuration.nix ~/PATH/TO/DIRECTORY/hosts/laptop
```

5. Rebuild with the flake *(inside dot-nixe directory)*:
```bash
sudo nixos-rebuild switch --flake .
```

## Usage
todo

## showcase
todo

## Contributing
todo

## License
todo
