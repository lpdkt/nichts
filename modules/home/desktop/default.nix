{ pkgs, ... }:
{
  imports = [
    ./foot.nix
    ./fuzzel.nix
    ./gtk.nix
    ./niri.nix
    ./noctalia.nix
  ];

  home.packages = with pkgs; [
    thunar
    thunar-volman
    tumbler
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
