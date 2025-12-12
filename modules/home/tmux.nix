{ pkgs, ... }:
let
  tmux-sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer" ''
    if [[ $# -eq 1 ]]; then
      selected=$1
    else
      selected=$(find ~/ ~/bin ~/code/** ~/documents/notes /mnt/media -mindepth 1 -maxdepth 1 -type d ! -name ".*" | fzf)
    fi

    if [[ -z $selected ]]; then
      exit 0
    fi

    selected_name=$(basename "$selected" | tr . _)
    tmux_running=$(pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
      tmux new-session -s $selected_name -c $selected
      exit 0
    fi

    if ! tmux has-session -t=$selected_name 2> /dev/null; then
      tmux new-session -ds $selected_name -c $selected
    fi

    tmux switch-client -t $selected_name
  '';
in
{
  home.packages = [ tmux-sessionizer ];

  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "foot";
    mouse = true;
    prefix = "C-a";
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 0;

    extraConfig = ''
      set -g status on
      set -g set-clipboard on
      set -g renumber-windows on
      set -g status-justify absolute-centre
      set -g status-position top
      set -g status-style "bg=default"
      set -g window-status-current-style "fg=blue bold"
      set -g status-left "#S"
      set -g status-left-length 80
      set -g status-right ""
      set -g status-interval 5
      set -g destroy-unattached off
      bind-key -r f run-shell "tmux neww tmux-sessionizer"
      bind-key b set-option status
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
  };
}
