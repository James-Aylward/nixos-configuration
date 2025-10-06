
{ pkgs }:
pkgs.writeShellScriptBin "dwmvpn" ''
# Create a list of wireguard VPNS
options=$(nmcli connection show | grep wireguard | sed 's/ .*//')

# Let the user select a description
selection=$(echo "$options" | dmenu -i -l 5 -c -p "VPN:")

actives=$(nmcli connection show --active)

# Set the selected sink as default
    if [[ "$actives" == *"$selection"* ]]; then
# Turn off
    nmcli connection down $selection
    notify-send $selection "Connection deactivated"
    else
# Turn on
    nmcli connection up $selection
    notify-send $selection "Connection activated"
    fi
    ''
