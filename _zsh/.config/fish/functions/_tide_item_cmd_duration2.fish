function _tide_item_cmd_duration2
    test $CMD_DURATION -gt $tide_cmd_duration_threshold && t=(
            math -s0 "$CMD_DURATION/3600000" # Hours
            math -s0 "$CMD_DURATION/60000"%60 # Minutes
            math -s0 "$CMD_DURATION/1000"%60 # Seconds
            math -s0 "$CMD_DURATION"%1000 # Milliseconds
            ) if test $t[1] != 0
        _tide_print_item cmd_duration $tide_cmd_duration_icon' ' "$t[1]h $t[2]m $t[3]s"
    else if test $t[2] != 0
        _tide_print_item cmd_duration $tide_cmd_duration_icon' ' "$t[2]m $t[3]s"
    else if test $t[3] != 0
        _tide_print_item cmd_duration $tide_cmd_duration_icon' ' "$t[3]s"
    else
        _tide_print_item cmd_duration $tide_cmd_duration_icon' ' "$t[4]ms"
    end
end
