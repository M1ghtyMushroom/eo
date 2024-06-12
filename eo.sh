#!/bin/bash

# help function
help() {
    echo "eo - Tool for optimal battery health.
    It checks the battery status and percentage every 10 minutes.
    If while charging the battery is over 85%, it sends a notification.
    -------------------------------------
    Usage: eo [start|install|auto]
        start   Start the script to monitor battery health.
        install Install the script to /usr/bin.
        auto    Configure automatic setup."
}

# Function to send notification
notify_user() {
    notify-send -t 5000 "Battery Alert" "Battery is over 80%. Unplug for optimal battery health."
}

# Function to check if required commands are installed
check_dependencies() {
    if ! command -v acpi &> /dev/null || ! command -v notify-send &> /dev/null
    then
        echo "Please make sure to install 'acpi' and 'libnotify' on your machine!"
        echo "Exiting.."
        exit 1
    fi
}

# Function to get battery information
get_battery_info() {
    battery_info=$(acpi -b)
    battery_percentage=$(echo "$battery_info" | grep -P -o '[0-9]+(?=%)')
    battery_status=$(echo "$battery_info" | grep -P -o 'Charging|Discharging|Full|Unknown')
}

# Function to check battery status and percentage
check_battery() {
    if [[ ("$battery_status" == "Charging" || "$battery_status" == "Full") && "$battery_percentage" -gt 85 ]]; then
        notify_user
    fi
}

install_script() {
    sudo cp "$0" /usr/bin/eo
    echo "> Script installed to /usr/bin as 'eo'."
}

# Function to handle the $1 parameter
handle_parameter() {
    case "$1" in
        help)
            help
            ;;
        start)
            main &
            ;;
        install)
            install_script
            ;;
        auto)
            if ! command -v eo &> /dev/null; then
                install_script
            fi
            if ! grep -q "eo% tool for optimal battery health." ~/.profile; then
                echo "eo #eo% tool for optimal battery health." >> ~/.profile
                echo "> Configuration added to ~/.profile."
            fi
            echo "> Setup successful."
            ;;
        *)
            echo "> Invalid parameter. Run 'eo help' for more information."
            exit 1
            ;;
    esac
}

# Main function to run the script logic
main() {
    echo "> eo% is now running.."
    while true; do
        get_battery_info
        check_battery
        sleep 600  # Sleep for 10 minutes before checking again
    done
}

# Check the parameter
check_dependencies
if [[ -n "$1" ]]; then
    handle_parameter "$1"
else
    help
fi
