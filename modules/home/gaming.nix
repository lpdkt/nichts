{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    olympus
    lutris
    winetricks
    protonup-qt
    wine
    (retroarch.withCores (
      cores: with cores; [
        mgba
        pcsx2
        citra
      ]
    ))
  ];
}
