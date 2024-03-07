# Qtile Config File
# http://www.qtile.org/

# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles


import subprocess
from os import path

from libqtile import hook

from settings.groups import groups
from settings.keys import keys, mod
from settings.layouts import floating_layout, layouts
from settings.mouse import mouse
from settings.path import qtile_path
from settings.screens import screens
from settings.widgets import extension_defaults, widget_defaults

# mod = mod
# keys = keys
# screens = screens
# groups = groups
# floating_layout = floating_layout
# layouts = layouts
# mouse = mouse
# extension_defaults = extension_defaults
# widget_defaults = widget_defaults


@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, "autostart.sh")])


main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
reconfigure_screens = True
auto_minimise = True
# focus_on_window_activation = "urgent"
# focus_on_window_activation = "smart"
focus_on_window_activation = "focus"
wmname = "LG3D"
