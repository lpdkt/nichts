{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ./waybar.css;

    settings = {
      mainBar = {
        height = 30;
        spacing = 0;
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "mpris" ];
        modules-right = [
          "battery"
          "cpu"
          "memory"
          "pulseaudio"
          "pulseaudio#microphone"
          "clock"
          "tray"
        ];

        "hyprland/window" = {
          format = "{}";
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
          all-outputs = true;
          on-click = "activate";
        };

        "river/tags" = {
          hide-vacant = true;
        };

        tray = {
          icon-size = 18;
          spacing = 10;
        };

        cpu = {
          interval = 1;
          format = "  {}%";
        };

        memory = {
          interval = 1;
          format = "  {}%";
        };

        clock = {
          format = "󰃰  {:%d.%m.%Y %H:%M }";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞 "
            "󰃝 "
            "󰃟 "
            "󰃠 "
          ];
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
          min-length = 6;
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-right-click = "pavucontrol";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          scroll-step = 5;
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [
              " "
              " "
              " "
            ];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "󰍮 {volume}%";
          format-source-muted = "󰍮 Muted";
          on-click = "pamixer --default-source -t";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
          scroll-step = 5;
        };

        network = {
          # interface = "wlp2*"; # (Optional) To force the use of this interface
          format-wifi = "  {signalStrength}%";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{essid} - {ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}:{essid} {ipaddr}/{cidr}";
        };

        bluetooth = {
          format = " {status}";
          format-disabled = ""; # an empty format will hide the module
          format-connected = " {num_connections}";
          tooltip-format = "{device_alias}";
          tooltip-format-connected = " {device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
        };

        mpris = {
          title-len = 40;
          interval = 1;
          album-len = 0;
          max-len = 60;
          max-empty-time = 60;
          format = "{player_icon} {artist} - {title}";
          format-paused = "{status_icon} {artist} - {title}";
          player-icons = {
            default = " ";
          };
          status-icons = {
            playing = " ";
            paused = " ";
          };
          ignored-players = [
            "librewolf"
            "vlc"
            "firefox"
            "chromium"
            "brave"
          ];
        };

        mpd = {
          format = "{stateIcon} {artist} - {title}";
          format-disconnected = "Disconnected ";
          format-stopped = "";
          format-empty = "";
          interval = 1;
          on-click = "mpc toggle";
          consume-icons = {
            on = " "; # Icon shows only when "consume" is on
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = " 1";
          };
          state-icons = {
            paused = " ";
            playing = " ";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
      };
    };
  };
}
