{ pkgs, ... }:
{
  imports = [
    ./waybar
    ./hyprlock.nix
    ./foot.nix
    ./fuzzel.nix
    ./gammastep.nix
    ./gtk.nix
    ./mako.nix
    ./river.nix
    ./swww.nix
  ];

  services.network-manager-applet.enable = true;

  home.packages = with pkgs; [
    thunar
    thunar-volman
    tumbler
    xfconf
    ffmpegthumbnailer
    libnotify
    gnome-keyring
    wl-clipboard
    pavucontrol
    pamixer
    playerctl
    brightnessctl
    wlopm
    wlr-randr
  ];
}
