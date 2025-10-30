For when you need a basic desktop environment (based on Hyprland and waybar) quickly.

## Features
- Using Nix with Home-manager to achieve cross distro. (Tested on Debian 13)
  - PAM does not work for programs installed using Nix, so that zsh and swaylock will be installed using distro package manager.
  - Configuration files are **not** managed by Home-manager for those customed to the traditional way managing dotfiles.
- Idempotent install script.

## Installation
Run `./setup install` to install.

Run `./setup -h` for more subcommands.

Run `./setup <subcommand> -h` for more options.

## Usage
Basic keybinds:
- `Super+Return`: Launch terminal (foot).
- `Super+X`: Close window.
- `Super+/`: App launcher.
- `Super+V`: Clipboard history.
- `Super+F1`: Lock screen.

Navigate:
- `Super+H/J/K/L`: Switch window focus.
- `Super+<num>`: Switch to workspace `<num>`.
- `Super+[/]`: Switch to prev/next workspace.

Control window:
- `Super+Shift+H/J/K/L`: Move window position.
- `Super+Alt+H/J/K/L`: Resize window.
- `Super+;`: Change window split orientation.
- `Super+Shift+<num>`: Move window to workspace `<num>`.

## TODO
- [ ] Clean up the codes to achieve minimal.
- [ ] Switch to the screenlock installed by Nix.
