{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  home = {
    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      QT_QPA_PLATFORM = "wayland";
      GTK_USE_PORTAL = 1;
      NIXOS_OZONE_WL = 1;
      MOZ_ENABLE_WAYLAND = 1;
    };
    stateVersion = "26.05";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };
    fzf = {
      enable = true;
      defaultOptions = [
        "--color=16"
        "--layout=reverse"
      ];
    };
  };

  home.packages = with pkgs; [

    # gui
    gimp
    qbittorrent
    libreoffice
    nicotine-plus
    picard
    keepassxc
    obsidian
    calibre
    koreader
    kcc
    bottles
    reaper
    tuxguitar
    freetube

    # nix cli
    statix
    nixfmt
    treefmt
    deadnix

    # cli
    python3
    docker
    distrobox
    ffmpeg-full
    ripgrep
    fd
    jq
    yq-go
    file
    which
    tree
    zip
    unzip
    p7zip
    killall
    btop
    fastfetch
    gdu
    gparted
    duf
    yt-dlp
    abcde
    sacad
    streamrip
  ];
}
