{ pkgs, ... }:
{
  services.swww.enable = true;

  home.packages = [
    (pkgs.writeShellScriptBin "setbg" ''
      swww img -t none ~/nichts/modules/home/desktop/wallpaper/mima.jpg
    '')
  ];
}
