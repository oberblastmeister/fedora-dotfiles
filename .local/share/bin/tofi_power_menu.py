#!/usr/bin/env python3

import subprocess
import sys

def main():
    # Define power menu options with their corresponding commands
    power_options = {
        "Lock": ["swaylock"],
        "Logout": ["niri", "msg", "action", "quit"],
        "Suspend": ["systemctl", "suspend"],
        "Restart": ["systemctl", "reboot"],
        "Shutdown": ["systemctl", "poweroff"],
        "Hibernate": ["systemctl", "hibernate"],
        "Reboot to UEFI": ["systemctl", "reboot", "--firmware-setup"]
    }
    
    # Create newline-separated menu items for tofi
    menu_text = "\n".join(power_options.keys())
    
    # Feed menu options to tofi and get selection
    result = subprocess.run(
        ["tofi"],
        input=menu_text,
        text=True,
        capture_output=True,
    )
    
    selected_option = result.stdout.strip()
    
    # Check if a valid option was selected
    if selected_option in power_options:
        command = power_options[selected_option]
        
        # Execute the selected command
        subprocess.run(command, check=True)
    else:
        # User cancelled or selected invalid option
        print("No valid option selected")

if __name__ == "__main__":
    main()
