{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./waybar
    ./awww.nix
    ./dunst.nix
    ./foot.nix
    ./fuzzel.nix
    ./gammastep.nix
    ./gtk.nix
  ];

  services = {
    network-manager-applet.enable = true;
  };

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
  ];
}
