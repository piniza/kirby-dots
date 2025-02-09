#!/usr/bin/env python3

import subprocess
import i3ipc
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

def get_icon(class_name):
    icon_theme = Gtk.IconTheme.get_default()
    icon_info = icon_theme.lookup_icon(class_name.lower(), 32, 0)
    if icon_info:
        return icon_info.get_filename()
    else:
        fallback_icon = icon_theme.lookup_icon("application-x-executable", 32, 0)
        return fallback_icon.get_filename() if fallback_icon else None

i3 = i3ipc.Connection()
tree = i3.get_tree()

workspace_windows = {}
workspace_symbol = ""

for workspace in tree.workspaces():
    workspace_windows[workspace.name] = []
    for window in workspace.leaves():
        class_name = window.window_class if window.window_class else "Unknown"
        icon_path = get_icon(class_name)
        icon_display = f"\0icon\x1f{icon_path}" if icon_path else ""

        workspace_windows[workspace.name].append(
            f"{workspace.name} | {class_name} [ID={window.window}]{icon_display}"
        )

rofi_input = []
for workspace, windows in workspace_windows.items():
    #rofi_input.append(f"{workspace_symbol} Workspace {workspace}")
    rofi_input.extend(windows)

if rofi_input:
    rofi_output = subprocess.run(
        [
            "rofi",
            "-dmenu",
            "-i",
            "-theme",
            "~/.config/polybar/scripts/rofi/launcher1.rasi",
            "-p",
            "Switch to:",
        ],
        input="\n".join(rofi_input).encode(),
        stdout=subprocess.PIPE,
    ).stdout.decode("utf-8").strip()
else:
    subprocess.run(["rofi",  
    				"-theme",
    				"~/.config/polybar/scripts/rofi/message.rasi",
    				"-e",
    				"No windows available."])

if rofi_output and "[ID=" in rofi_output:
    try:
        window_id = int(rofi_output.split("[ID=")[-1].split("]")[0])
        i3.command(f"[id={window_id}] focus")
    except Exception as e:
        subprocess.run(["rofi", "-e", f"Error: {e}"])
