{ pkgs, ... }:
let
  screenshot = pkgs.writeShellApplication {
    name = "screenshot";
    runtimeInputs = with pkgs; [
      grim
      slurp
      wl-clipboard
    ];
    text = ''
      dir="$HOME/pictures/sc"
      filename="screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
            
      if [ "$#" -gt 0 ] && [ "$1" = "select" ]; then 
        grim -g "$(slurp)" - | tee "$dir/$filename" | wl-copy
      else 
        grim - | tee "$dir/$filename" | wl-copy
      fi
    '';
  };
in
{
  imports = [ ./hyprlock.nix ];

  wayland.systemd.target = "hyprland-session.target";

  home.packages =
    (with pkgs; [
      hyprpicker
    ])
    ++ [ screenshot ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      exec-once = [ "setbg" ];

      monitor = [ ",preferred,auto,1" ];

      input = {
        kb_layout = "eu";
        kb_options = "caps:escape";
        follow_mouse = 1;
        sensitivity = 0.5;
        scroll_factor = 1.5;
        repeat_rate = 30;
        repeat_delay = 250;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgba(7aa2f7ff)";
        "col.inactive_border" = "rgba(414868aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      animations.enabled = false;

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Adwaita"
        "GTK_THEME,Tokyonight-Dark"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland,x11,*"
      ];

      windowrule = [ ];

      windowrulev2 = [ ];

      bind = [
        "SUPER, return, exec, foot"
        "SUPER, Q, killactive,"
        "SUPER, F, fullscreen, 1" # maximize window
        "SUPER SHIFT, F, fullscreen, 0" # fullscreen
        "SUPER, W, exec, librewolf"
        "CTRL ALT, delete, exit,"
        "SUPER, E, exec, thunar"
        "SUPER SHIFT, E, exec, foot -e yazi"
        "SUPER, V, togglefloating,"
        "SUPER, D, exec, fuzzel"
        "SUPER SHIFT, P, pseudo,"
        "SUPER, U, layoutmsg, togglesplit"
        "SUPER, P, exec, pavucontrol"
        "SUPER, M, exec, pamixer --default-source -t" # mute mic
        "SUPER SHIFT, M , exec, pamixer -t" # mute sound
        "SUPER, F7, exec, playerctl previous"
        "SUPER, F8, exec, playerctl next"
        "SUPER, F9 , exec, playerctl play-pause"
        "SUPER, F10 , exec, playerctl volume 0.05-"
        "SUPER, F11 , exec, playerctl volume 0.05+"
        "SUPER, F12, exec, playerctl stop"
        "SUPER, N, exec, foot -e rmpc"
        "SUPER, Y, exec, ytmpv"
        "SUPER SHIFT, Y, exec, ytdl"

        "SUPER, comma, exec, mullvad connect"
        "SUPER SHIFT, comma, exec, mullvad disconnect"

        # Screenshot bindings
        "SUPER ALT, S, exec, screenshot"
        "SUPER SHIFT, S, exec, screenshot select"

        # Focus movement with vim keys
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        # Swap windows
        "SUPER SHIFT, h, movewindow, l"
        "SUPER SHIFT, l, movewindow, r"
        "SUPER SHIFT, k, movewindow, u"
        "SUPER SHIFT, j, movewindow, d"

        # Resize Windows
        "SUPER ALT, l, resizeactive, 50 0"
        "SUPER ALT, h, resizeactive, -50 0"
        "SUPER ALT, k, resizeactive, 0 -50"
        "SUPER ALT, j, resizeactive, 0 50"

        # Workspace switching
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"
        "SUPER, TAB, workspace, previous" # jump to last used workspace

        # Move windows to workspaces
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"
      ];

      # Mouse bindings
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };
  };

}
