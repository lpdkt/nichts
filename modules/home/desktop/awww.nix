{ pkgs, ... }:
{
  services.awww.enable = true;

  home.packages = [
    (pkgs.writeShellScriptBin "setbg" ''
      awww img -t none ~/nichts/modules/home/desktop/wallpaper/mima.jpg
    '')
  ];
}
