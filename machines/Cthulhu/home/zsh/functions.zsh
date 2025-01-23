function airplane_mode_toggle() {
    local backup_file=~/.cache/airplane_backup

    if [ -e "$backup_file" ]; then
        # Read network states from the backup file
        local wifi_status=$(grep -o 'wifi:\(on\|off\)$' "$backup_file" | cut -d':' -f2)
        local bluetooth_status=$(grep -o 'bluetooth:\(on\|off\)$' "$backup_file" | cut -d':' -f2)

        # Restore network states
        if [ "$wifi_status" = "on" ]; then
            rfkill unblock wifi
        fi

        if [ "$bluetooth_status" = "on" ]; then
            rfkill unblock bluetooth
        fi

        # Remove the backup file
        rm "$backup_file"
    else
        # Backup the current network states and turn off all networks
        echo "wifi:$(rfkill list wifi | grep -q "Soft blocked: no" && echo "on" || echo "off")" > "$backup_file"
        echo "bluetooth:$(rfkill list bluetooth | grep -qi "Soft blocked: no" && echo "on" || echo "off")" >> "$backup_file"

        rfkill block wifi
        rfkill block bluetooth
    fi
}

function bluetooth_toggle() {
    local bluetooth_status=$(rfkill list bluetooth | grep -i -o "Soft blocked: yes")
    local backup_file=~/.cache/airplane_backup

    if [ -z "$bluetooth_status" ]; then
        rfkill block bluetooth
    else
        rfkill unblock bluetooth
        if [ -e "$backup_file" ]; then
            rm "$backup_file"
        fi
    fi
}

function check_airplane_mode() {
    local backup_file=~/.cache/airplane_backup

    if [ -e "$backup_file" ]; then
        echo "{ \"text\":\"󰀝\", \"tooltip\": \"airplane-mode <span color='#a6da95'>on</span>\", \"class\": \"on\" }"
    else
        echo "{ \"text\":\"󰀞\", \"tooltip\": \"airplane-mode <span color='#ee99a0'>off</span>\", \"class\": \"off\" }"
    fi
}

function check_recording() {
    local target_process="wl-screenrec"

    if pgrep "$target_process" >/dev/null; then
        echo "{\"text\":\"\", \"tooltip\":\"Recording\", \"alt\":\"Recording\"}"
    fi
}

function check_webcam() {
    local process_pids=$(fuser /dev/video0 2>/dev/null | awk '{print $2}' | sort -u)
    if [ -n "$process_pids" ]; then
        local processes=""
        for process_pid in $process_pids; do
            local process_name=$(ps -q "$process_pid" -o comm=)
            processes="$processes\n<span color='#eed49f'>$process_name($process_pid)</span>"
        done
        echo "{\"text\":\"󰖠\", \"tooltip\":\"webcam is used by: $processes\", \"alt\":\"Webcam\"}"
    fi
}

function clipboard_clear() {
    rm "$HOME/.cache/cliphist/db"
    dunstify "Clipboard Cleared" -t 2000
}

function clipboard_delete_item() {
    local clip=$(cliphist list | rofi -dmenu -p 'clipboard delete item')
    if [ -n "$clip" ]; then
        echo "$clip" | cliphist delete
        dunstify "Clipboard" "Clip '$clip' was deleted" -t 2000
    fi
}

function clipboard_to_type() {
    cliphist list | rofi -dmenu -p clipboard | cliphist decode | wtype -
}

function clipboard_to_wlcopy() {
    local clip=$(cliphist list | rofi -dmenu -p 'clipboard copy')
    if [ -n "$clip" ]; then
        echo "$clip" | cliphist decode | wl-copy
        dunstify "Clipboard" "Clip '$clip' was copied" -t 2000
    fi
}

function dunst_pause() {
    local COUNT_WAITING=$(dunstctl count waiting)
    local COUNT_DISPLAYED=$(dunstctl count displayed)
    local ENABLED="{ \"text\": \"󰂜\", \"tooltip\": \"notifications <span color='#a6da95'>on</span>\", \"class\": \"on\" }"
    local DISABLED="{ \"text\": \"󰪑\", \"tooltip\": \"notifications <span color='#ee99a0'>off</span>\", \"class\": \"off\" }"
    
    if [ "$COUNT_DISPLAYED" != "0" ]; then
        ENABLED="{ \"text\": \"󰂚$COUNT_DISPLAYED\", \"tooltip\": \"$COUNT_DISPLAYED notifications\", \"class\": \"on\" }"
    fi

    if [ "$COUNT_WAITING" != "0" ]; then
        DISABLED="{ \"text\": \"󰂛$COUNT_WAITING\", \"tooltip\": \"(silent) $COUNT_WAITING notifications\", \"class\": \"off\" }"
    fi

    if dunstctl is-paused | grep -q "false"; then
        echo "$ENABLED"
    else
        echo "$DISABLED"
    fi
}

function fetch_music_player_data() {
    playerctl -a metadata --format "{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"<i><span color='#a6da95'>{{playerName}}</span></i>: <b><span color='#f5a97f'>{{artist}}</span> - <span color='#c6a0f6'>{{markup_escape(title)}}</span></b>\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}" -F
}

function wifi_toggle() {
    local wifi_status=$(rfkill list wifi | grep -i -o "Soft blocked: yes")
    local backup_file=~/.cache/airplane_backup

    if [ -z "$wifi_status" ]; then
        rfkill block wifi
    else
        rfkill unblock wifi
        if [ -e "$backup_file" ]; then
            rm "$backup_file"
        fi
    fi
}

function wlogout_uniqe() {
    if [ -z "$(pidof wlogout)" ]; then
        wlogout
    fi
}

