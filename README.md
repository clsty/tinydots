# Tinydots

This project is:
- A starter or template for beginner to use Nix on non-NixOS distro.
- A lightweight repo which setups basic desktop environment (based on Hyprland and waybar) quickly.
- An elegant solution for Debian stable users (e.g. the repo owner, @clsty) who still want to use Hyprland.

## Features
- Idempotent install script.
- Powered by Nix with Home-manager to achieve cross distro.
  - Tested on Debian 13.

_Note: Configuration files are **not** managed by Home-manager for those customed to the traditional way managing dotfiles, except for several files under `~/.config/fontconfig/conf.d/`._

<img width="1800" height="1200" alt="A simple screenshot" src="https://github.com/user-attachments/assets/20e4ee84-3c6e-4364-8cb4-318918e608ef" />

## Installation
Clone this repo:
```
git clone --depth=1 https://github.com/clsty/tinydots
cd tinydots
```
Run `./setup install` to install.
- `zsh` and `swaylock` are still installed by system PM (Package Manager) due to limitation of Nix on non-NixOS distros.
- `curl` and `git` are also needed to be installed by system PM, but this is actually that you need `curl` and `git` for the install script itself.

Run `./setup -h` for more subcommands.

Run `./setup <subcommand> -h` for more options.

## Usage
To launch Hyprland, login on a `tty` and run `hyprland;exit`.

If you use Zsh as default shell then Hyprland will autostart after the login on `tty1`.

Basic keybinds:
- `Super`+`Return`: Launch terminal (foot).
- `Super`+`X`: Close window.
- `Super`+`/`: App launcher.
- `Super`+`V`: Clipboard history.
- `Super`+`F1`: Lock screen.
- `Super`+`Delete`: Power menu.
- `Super`+`Ctrl`+`[`/`]`: Toggle left/right panel.

Navigate:
- `Super`+`H`/`J`/`K`/`L`: Switch window focus.
- `Super`+`<num>`: Switch to workspace `<num>`.
- `Super`+`[`/`]`: Switch to prev/next workspace.

Control window:
- `Super`+`Shift`+`H`/`J`/`K`/`L`: Move window position.
- `Super`+`Alt`+`H`/`J`/`K`/`L`: Resize window.
- `Super`+`;`: Change window split orientation.
- `Super`+`Shift`+`<num>`: Move window to workspace `<num>`.

For other keybinds see `~/.config/hypr/hyprland/keybinds.conf`.

## Credits
Thanks for all developers and contributors of the FOSS projects involved in this repo. Some of them are listed below:
- Zsh
- Foot
- Hyprland
- Waybar
- Swaylock
- Nix
- Home-manager
