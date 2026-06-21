{ pkgs, ... }:
{
  imports = [
    ./noctalia
    ./awww.nix
    ./foot.nix
    ./fuzzel.nix
    ./gtk.nix
    ./niri.nix
  ];

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
    playerctl
    brightnessctl
    woomer
  ];
}
