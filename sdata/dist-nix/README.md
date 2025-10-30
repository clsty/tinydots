# Install scripts using Nix to achieve cross-distros
- This directory is currently WIP.

**NOTE: The sdata/dist-nix is not for NixOS but every distro, using Nix and home-manager.**

## plan
TODO:
Write a proper `flake.nix` and optionally `home.nix` and other files under `./sdata/dist-nix/iiqs-hm/` to install all dependencies that `./sdata/dist-arch/install-deps.sh` does. (**excluding** the screenlock)

TODO:
In this script, implement the process below:
2. If nix not installed:
   1. install nix via [NixOS/experimental-nix-installer](https://github.com/NixOS/experimental-nix-installer)
   2. Enable nix for shell 
      - Update: Skip this step cuz the nix-installer will handle it automatically e.g. in `/etc/zsh/zshrc`.
   3. Ensure the experimental feature, Nix Flake, is enabled.
3. cd to `iiqs-hm` and use something like `home-manager switch --flake .#iiqs` to install the dependencies.
4. Install screen lock using system package manager of the current distro.

Note that this script must be idempotent.

## Attentions
### PAM
On non-NixOS distros, programs using PAM (typically screen locker) will not work if installed via Nix, so user has to use their own distro's package for the screen lock.

- One problem is that Debian(-based) distros use modified version of PAM which supports `@include` directive in `/etc/pam.d` config files but the PAM from Nix does not support it, see [this comment](https://github.com/NixOS/nixpkgs/issues/128523#issuecomment-1086106614).
- Another problem is the location of a suid helper binary that is necessary, see [this comment](https://github.com/end-4/dots-hyprland/issues/1061#issuecomment-3403195230).

The problem could be solved by using the system-provided libpam instead.

See also https://github.com/caelestia-dots/shell/issues/668

### NixGL
On non-NixOS distros, packages installed via home-manager have problem accessing GPU, especially Hyprland because it requires GPU acceleration to launch. `nixGL` should be used to address the problem.
