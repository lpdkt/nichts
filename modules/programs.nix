{
  programs = {
    fish.enable = true;
    nix-ld.enable = true;
    nh = {
      enable = true;
      flake = "/home/leroy/nichts";
    };
    dconf.enable = true;
    localsend = {
      enable = true;
      openFirewall = true;
    };
  };
}
