function _tide_item_os2
    _tide_detect_os | read -g --line os_branding_icon os_branding_color os_branding_bg_color
    set -U tide_os_bg_color normal
    set -U tide_os_color white
    set -U tide_os_icon $os_branding_icon

    _tide_print_item os $tide_os_icon
end
