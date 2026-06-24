{ pkgs, inputs, ... }:
{
  imports = [ inputs.niri.nixosModules.niri ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    wlr.enable = true;

    config = {
      common.default = [
        "gtk"
        "gnome"
      ];
      niri.default = [
        "gtk"
        "gnome"
      ];
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  services.displayManager = {
    enable = true;
    ly.enable = true;
  };

  environment.systemPackages = with pkgs; [ xwayland-satellite ];
}
