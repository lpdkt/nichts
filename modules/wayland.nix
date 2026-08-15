{
  pkgs,
  inputs,
  ...
}:
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

  programs.niri.enable = true;

  services.displayManager.ly = {
    enable = true;
    settings = {
      clear_password = true;
      xinitrc = "";
      setup_cmd = "";
      session_log = "/home/leroy/.local/state/ly-session.log";
    };
  };

  environment.systemPackages = with pkgs; [ xwayland-satellite ];
}
