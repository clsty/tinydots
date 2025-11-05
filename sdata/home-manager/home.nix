{ config, lib, pkgs, nixgl, home_attrs, ... }:
{
  programs.home-manager.enable = true;
  nixGL.packages = nixgl.packages;
  nixGL.defaultWrapper = "mesa";

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
  ## Allow fontconfig to discover fonts in home.packages
  fonts.fontconfig.enable = true;

  # home.sessionVariables.NIXOS_OZONE_WL = "1";
  wayland.windowManager.hyprland = {
    ## Make sure home-manager not generate ~/.config/hypr/hyprland.conf
    systemd.enable = false; plugins = []; settings = {}; extraConfig = "";
    enable = true;
    ## Use NixGL
    package = config.lib.nixGL.wrap pkgs.hyprland;
  };

  home = {
    packages = with pkgs; [
      ##### Sure #####
      ## Basic cli tool
      ## inetutils: provides hostname, ifconfig, ping, etc.
      ## libnotify: provides notify-send
      jq rsync inetutils libnotify
      ## Media related
      brightnessctl playerctl pavucontrol
      ## Recording/Screenshot/Color picker
      grim slurp satty hyprpicker
      ## Clipboard/Emoji
      wl-clipboard copyq rofimoji cliphist
      ## Widget
      rofi-wayland fuzzel waybar
      ## Notification
      swaynotificationcenter
      ## Terminal and shell
      foot starship

      ##### Fonts/Icons/Cursors/Decoration #####
      fontconfig
      ## For Waybar
      nerd-fonts.droid-sans-mono
      ## For Foot
      nerd-fonts.jetbrains-mono
      ## For other things
      fira-code fira-code-symbols nerd-fonts.fira-code
      ## For fallback
      noto-fonts noto-fonts-emoji
      ## Used with fuzzel
      candy-icons
      ## Cursor theme
      bibata-cursors
      ## Wallpaper
      swww

      ##### Other basic things #####
      dbus xorg.xlsclients blueman networkmanager hypridle
    ]
    ++ [
    ##### Ones needing GPU #####
    #(config.lib.nixGL.wrap pkgs.firefox-bin)
    ];
  }//home_attrs;
}
