{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./mount.nix
    ./../../modules

    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "noise";

  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  users.users.leroy = {
    isNormalUser = true;
    description = "leroy";
    home = "/home/leroy";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.leroy = {
      imports = [ ./../../modules/home ];
      programs.niri.settings.outputs."DP-1" = {
        mode = {
          width = 2560;
          height = 1440;
          refresh = 180.063;

        };
        scale = 1;
        position = {
          x = 0;
          y = 0;
        };
      };
    };
    extraSpecialArgs = { inherit inputs; };
  };
}
