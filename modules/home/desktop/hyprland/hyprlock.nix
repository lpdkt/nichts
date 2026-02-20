{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
      };

      auth.fingerprint = {
        enabled = true;
        ready_message = "<span>  </span>";
        present_message = "<span foreground='##94E2D5'>  </span>";
      };

      label = [
        {
          text = "$FPRINTPROMPT";
          font_size = 50;
          position = "-6, 0"; # the unicode symbol is slightly out of center
        }
        {
          text = "$TIME";
          valign = "top";
          halign = "left";
          position = "15, -10";
        }
        {
          text = ''cmd[update:10000] echo "$(cat /sys/class/power_supply/BAT0/capacity)%"'';
          valign = "top";
          halign = "right";
          position = "-15, -10";
        }
      ];

      input-field = {
        position = "0, -70";
        outline_thickness = 0;
        dots_size = 0.2;
        fade_on_empty = false;
        swap_font_color = true;
        placeholder_text = "";
        font_family = "Iosevka Nerd Font";
        font_color = "rgba(254, 254, 254, 1.0)";
        inner_color = "rgba(0, 0, 0, 0.0)";
        check_color = "rgba(148, 226, 213, 1.0)";
      };
    };
  };

  services.hypridle = {
    enable = true;
    settings =
      let
        lockTimeout = 10 * 60;
        blankTimeout = 15;
        suspendTimeout = 30 * 60;
        screenLocker = "hyprlock";
        screenOn = "hyprctl dispatch dpms on";
        screenOff = "hyprctl dispatch dpms off";
      in
      {
        general = {
          lock_cmd = "pidof ${screenLocker} || ${screenLocker}";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "${screenOn}";
        };
        listener = [
          {
            timeout = lockTimeout;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = lockTimeout + blankTimeout;
            on-timeout = screenOff;
            on-resume = screenOn;
          }
          {
            timeout = blankTimeout;
            on-timeout = "pidof ${screenLocker} && ${screenOff}";
            on-resume = screenOn;
          }
          {
            timeout = suspendTimeout;
            on-timeout = "systemctl suspend";
          }
        ];
      };
  };

}
