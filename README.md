# eo - EightyOne - 81% ⚡️

eo is a simple yet effective shell script designed to help you maintain optimal battery health 🔋 on your Linux system. It periodically checks the battery status and sends notifications when the battery level exceeds a specified threshold while charging, prompting you to unplug the charger to preserve battery longevity. 🔌

## Features ✨

- **Battery Monitoring**: Checks the battery status and percentage every 10 minutes. ⏱️
- **Notification System**: Sends a desktop notification when the battery level exceeds 80% while charging, reminding you to unplug for optimal battery health. 🔔
- **Easy Installation**: Can be installed system-wide for convenient access. 📥
- **Automatic Setup**: Configures the script to run automatically on system startup. 🚀

## Prerequisites 📋

Before using eo, ensure that you have the following dependencies installed on your system:

- `acpi`: A command-line utility for displaying battery status and information. 💻
- `libnotify`: A library for sending desktop notifications. 💬

You can install these dependencies using your system's package manager.

## Installation 🏗️

1. Clone the repository or download the script file. 📥
2. Open a terminal and navigate to the directory containing the script. 🖥️
3. Run the following command to install the script system-wide:

```bash
./eo.sh install
```

This will copy the script to `/usr/bin/eo` and make it accessible from anywhere on your system. 🌍

## Usage 🚀

After installation, you can use the following commands:

- `eo start`: Start the script to monitor battery health. 🔋
- `eo install`: Install the script to `/usr/bin`. 📥
- `eo auto`: Configure automatic setup to run the script on system startup. ⚙️
- `eo help`: Display the help information. ❓

## Automatic Setup ⏰

To configure eo to run automatically on system startup, use the `auto` command:

```bash
eo auto
```

This command will install the script (if not already installed) and add a line to your `~/.profile` file to start the script on login. 🔑

## Contributing 🤝

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request. 📣
