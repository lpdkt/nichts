{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    olympus
    lutris
    (retroarch.withCores (
      cores: with cores; [
        mgba
        pcsx2
        citra
      ]
    ))
  ];
}
