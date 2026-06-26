{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/bluetooth.nix
    ./../../modules/boot.nix
    ./../../modules/common.nix
    ./../../modules/dev.nix
    ./../../modules/fonts.nix
    ./../../modules/locale.nix
    ./../../modules/networking.nix
    ./../../modules/programs.nix
    ./../../modules/services.nix
    ./../../modules/ssh.nix
    ./../../modules/wayland.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "fade";

  hardware.graphics.enable = true;

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

  services.upower.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.leroy = {
      imports = [
        ./../../modules/home/desktop
        ./../../modules/home/browser.nix
        ./../../modules/home/common.nix
        ./../../modules/home/direnv.nix
        ./../../modules/home/email.nix
        ./../../modules/home/fish.nix
        ./../../modules/home/git.nix
        ./../../modules/home/gpg.nix
        ./../../modules/home/imv.nix
        ./../../modules/home/mpv.nix
        ./../../modules/home/neovim.nix
        ./../../modules/home/starship.nix
        ./../../modules/home/tmux.nix
        ./../../modules/home/xdg.nix
        ./../../modules/home/yazi.nix
        ./../../modules/home/zathura.nix
        ./../../modules/home/zsh.nix
      ];
      programs.niri.settings.outputs."eDP-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.09600;

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
