# The simple dock script

I use my laptop to do most of my work. This sript aides in putting my laptop
into a "Docking mode".

The script will only execute if the laptop is plugged in and is connected to 
an external display.

The script will then disable the onboard display and swicth to external display
only. The script will also disable the laptop from sleeping when the lid is
closed.

# How it works

This script uses a regular blank file called `dockfile` to indicate wether the
laptop has been put in dockmode that is written into the same directory as the 
executable. (Ensure this script is in a directory where it has permission to 
write to, I have it in a `.docking` directory in my home folder and have the 
`dock` executable symlinked to `/usr/local/bin`).

This script queries `/sys/class/power_supply/ADP1/online` to check if the 
laptop is plugged in.

This script queries `/sys/class/drm/card0-HDMI-A-1/status` to check if an
external display is plugged in.

The script uses `xrandr` to manage displays.

The script will create the `dockfile` and pass it to `is_docked.sh` which will
run until the `dockfile` is deleted. The script will run `systemd-inhibit` to 
prevent the laptop from sleeping when the lid is closed. `systemd-inhibit` 
will run until the exit of a target program. `is_docked.sh` is provided as the 
target program.

To undock, the script will disable the external display and re-enable the
internal display.

To undock, the script will delete the `dockfile` which causes `is_docked.sh` to
exit which in turn causes `systemd-inhibit` to exit which disables the sleep
prevention behaviour.

This script uses `i3-nagbar` to show error messages as it is intended to be run
from a launcher such as `dmenu` or `rofi` and as such requires a graphical
notfications.

# Requirements

* xorg (xrandr)
* systemd (systemd-inhibit)
* i3wm (i3-nagbar)
* bash
* system device information located in `/sys/class/` subdirectories

You will have to modify variables in the `dock` script to get it working on
your laptop. Good luck ('-')/

### License

GPLv3
