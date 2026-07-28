{ pkgs, ... }:
{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "/mnt/media/music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "pipewire output"
        }
        auto_update "yes"
        restore_paused "yes"
      '';
    };
    mpdris2.enable = true;
    mpdscribble = {
      enable = true;
      endpoints = {
        "last.fm" = {
          url = "http://post.audioscrobbler.com/";
          username = "lpdkt";
          passwordFile = "/home/leroy/.config/mpdscribble/lastfmpass";
        };
      };
    };
  };

  xdg.configFile = {
    "rmpc/config.ron".source = ./rmpc/config.ron;
    "rmpc/themes/theme.ron".source = ./rmpc/theme.ron;
  };

  home.packages = with pkgs; [
    rmpc
    mpc
  ];
}
