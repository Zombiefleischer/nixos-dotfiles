function airplane_mode_toggle
    set backup_file ~/.cache/airplane_backup

    if test -e $backup_file
        # Read network states from the backup file
        set -l wifi_status (cat $backup_file | grep -o 'wifi:\(on\|off\)$' | cut -d':' -f2)
        set -l bluetooth_status (cat $backup_file | grep -o 'bluetooth:\(on\|off\)$' | cut -d':' -f2)

        # Restore network states
        if test "$wifi_status" = on
            rfkill unblock wifi
            # else
            #     rfkill block wifi
        end

        if test "$bluetooth_status" = on
            rfkill unblock bluetooth
            # else
            #     rfkill block bluetooth
        end

        # Remove the backup file
        rm $backup_file
    else
        # Backup the current network states and turn off all networks
        echo "wifi:$(rfkill list wifi | grep -q "Soft blocked: no" && echo "on" || echo "off")" >$backup_file
        echo "bluetooth:$(rfkill list bluetooth | grep -qi "Soft blocked: no" && echo "on" || echo "off")" >>$backup_file
        # Add more lines to backup other network types if needed

        rfkill block wifi
        rfkill block bluetooth
    end
end

function bluetooth_toggle
    set bluetooth_status (rfkill list bluetooth | grep -i -o "Soft blocked: yes")
    set backup_file ~/.cache/airplane_backup

    if [ -z "$bluetooth_status" ]
        rfkill block bluetooth
    else
        rfkill unblock bluetooth
        if test -e $backup_file
            rm $backup_file
        end
    end
end

function check_airplane_mode
    set backup_file ~/.cache/airplane_backup

    if test -e $backup_file
        echo "{ \"text\":\"󰀝\", \"tooltip\": \"airplane-mode <span color='#a6da95'>on</span>\", \"class\": \"on\" }"
    else
        echo "{ \"text\":\"󰀞\", \"tooltip\": \"airplane-mode <span color='#ee99a0'>off</span>\", \"class\": \"off\" }"
    end
end

function check_recording
    set target_process wl-screenrec

    if pgrep $target_process >/dev/null
        echo "{\"text\":\"\", \"tooltip\":\"Recording\", \"alt\":\"Recording\"}"
    end
end

function check_webcam
    set process_pids (fuser /dev/video0 | awk '{print $2}' | sort -u)
    if test -n "$process_pids"
        set processes ""
        for process_pid in $process_pids
            set process_name (ps -q $process_pid -o comm=)
            set processes "$processes\n<span color='#eed49f'>$process_name($process_pid)</span>"
        end
        echo "{\"text\":\"󰖠\", \"tooltip\":\"webcam is used by: $processes\", \"alt\":\"Webcam\"}"
    end
end

function clipboard_clear
    rm "$HOME/.cache/cliphist/db"
    dunstify Clipboard Cleared -t 2000
end

function clipboard_delete_item
    set clip $(cliphist list | rofi -dmenu -p 'clipboard delete item')
    if not [ -z $clip ]
        echo $clip | cliphist delete
        dunstify "Clipboard" "Clip '$clip' was deleted" -t 2000
    end
end

function clipboard_to_type
    cliphist list | rofi -dmenu -p clipboard | cliphist decode | wtype -
end

function clipboard_to_wlcopy
    set clip $(cliphist list | rofi -dmenu -p 'clipboard copy')
    if not [ -z $clip ]
        echo $clip | cliphist decode | wl-copy
        dunstify "Clipboard" "Clip '$clip' was copied" -t 2000
    end
end

function dunst_pause
    set COUNT_WAITING (dunstctl count waiting)
    set COUNT_DISPLAYED (dunstctl count displayed)
    set ENABLED "{ \"text\": \"󰂜\", \"tooltip\": \"notifications <span color='#a6da95'>on</span>\", \"class\": \"on\" }"
    set DISABLED "{ \"text\": \"󰪑\", \"tooltip\": \"notifications <span color='#ee99a0'>off</span>\", \"class\": \"off\" }"
    
    if [ $COUNT_DISPLAYED != 0 ]
        set ENABLED "{ \"text\": \"󰂚$COUNT_DISPLAYED\", \"tooltip\": \"$COUNT_DISPLAYED notifications\", \"class\": \"on\" }"
    end

    if [ $COUNT_WAITING != 0 ]
        set DISABLED "{ \"text\": \"󰂛$COUNT_WAITING\", \"tooltip\": \"(silent) $COUNT_WAITING notifications\", \"class\": \"off\" }"
    end

    if dunstctl is-paused | rg -q "false"
        echo $ENABLED
    else
        echo $DISABLED
    end
end

function fetch_music_player_data
    playerctl -a metadata --format "{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"<i><span color='#a6da95'>{{playerName}}</span></i>: <b><span color='#f5a97f'>{{artist}}</span> - <span color='#c6a0f6'>{{markup_escape(title)}}</span></b>\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}" -F
end

function wifi_toggle
    set wifi_status (rfkill list wifi | grep -i -o "Soft blocked: yes")
    set backup_file ~/.cache/airplane_backup

    if [ -z "$wifi_status" ]
        rfkill block wifi
    else
        rfkill unblock wifi
        if test -e $backup_file
            rm $backup_file
        end
    end
end

function wlogout_uniqe
    if [ -z $(pidof wlogout) ]
        wlogout
    end
end
