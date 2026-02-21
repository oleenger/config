#!/usr/bin/env bash

# Unified fzf picker for tmux sessions + windows, Telescope-style
# No colors (robust), with preview.

# Build combined list:
# Sessions: "S  session-name"
# Windows:  "W  session:idx  window-name"
picker_list="$(
    tmux list-sessions -F 'S  #S' ;
    tmux list-windows  -a -F 'W  #S:#I  #W'
)"

choice="$(
    printf '%s\n' "$picker_list" \
    | fzf \
        --prompt="tmux> " \
        --reverse \
        --height=80% \
        --border \
        --header="Type to fuzzy-search. ENTER to switch. (S=session, W=window)" \
        --preview '
            line="{}"

            if printf "%s\n" "$line" | grep -q "^W  "; then
                # Window line: "W  session:idx  name"
                target=$(printf "%s\n" "$line" | awk "{print \$2}")
                session="${target%%:*}"
                win="${target#*:}"

                tmux list-panes -t "$session:$win" \
                    -F "Pane #{pane_index} | #{pane_title} | #{pane_current_path}"
            else
                # Session line: "S  session"
                session=$(printf "%s\n" "$line" | sed "s/^S  //")
                tmux list-windows -t "$session" \
                    -F "Window #{window_index} | #{window_name}"
            fi
        '
)"

# User cancelled
[ -z "$choice" ] && exit 0

# Decide

