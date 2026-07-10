{ inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      bar.default = {
        start = [ "workspaces" ];
        center = [ "media" ];
        end = [
          "notifications"
          "clipboard"
          "battery"
          "cpu"
          "ram"
          "bluetooth"
          "volume"
          "input_volume"
          "brightness"
          "weather"
          "date"
          "clock"
          "network"
          "tray"
          "session"
        ];
        font_family = "Iosevka NF";
        margin_edge = 0;
        margin_ends = 0;
        radius = 0;
        shadow = false;
        thickness = 30;
        widget_spacing = 10;
      };

      shell = {
        avatar_path = "/home/leroy/nichts/icon.png";
        font_family = "Iosevka NF";
        clipboard_confirm_clear_history = false;
        screen_time_enabled = true;
        mpris.blacklist = [ "firefox" ];
        panel = {
          clipboard_placement = "attached";
          open_near_click_control_center = true;
          open_near_click_clipboard = true;
          open_near_click_session = true;
        };
      };

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900;
          };
        };
      };

      location = {
        auto_locate = true;
        sunrise = "07:30";
        sunset = "20:30";
      };

      nightlight = {
        enabled = true;
        force = false;
        temperature_night = 3400;
      };

      osd.position = "top_right";

      theme = {
        builtin = "Tokyo-Night";
        mode = "dark";
        source = "builtin";
        templates.builtin_ids = [
          "btop"
          "cava"
          "gtk3"
          "gtk4"
          "niri"
        ];
      };

      wallpaper.directory = "/home/leroy/nichts/modules/home/desktop/wallpaper";

      backdrop.enabled = true;

      widget = {
        media = {
          hide_when_no_media = true;
          max_length = 500;
          title_scroll = "on_hover";
        };
        network.show_label = false;
        notifications.hide_when_no_unread = true;
        weather.show_condition = false;
        workspaces = {
          empty_color = "outline";
          hide_when_empty = true;
          minimal = true;
          occupied_color = "outline";
          scale = 1.3;
        };
      };
    };
  };
}
