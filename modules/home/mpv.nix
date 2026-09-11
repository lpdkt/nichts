{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      crop
      mpris
      mpv-webm
    ];

    config = {
      volume = 75;
      ytdl-format = "bestvideo+bestaudio/best";
      ytdl-raw-options = "sub-lang=en,write-subs=,embed-subs=";
      slang = "en,eng";
      gpu-context = "wayland";
    };

    bindings = {
      r = "cycle_values video-rotate 90 180 270 0";
    };
  };
}
