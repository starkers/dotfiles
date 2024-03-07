from libqtile.command import lazy
from libqtile.config import Key

mod = "mod4"
super = "mod4"
alt = "mod1"
ctrl = "control"
shift = "shift"

# NOTE: Dunno WTF to call a key? checkout
#       xev can be used to capture the input/keysym also..
# https://github.com/qtile/qtile/blob/v0.24.0/libqtile/backend/x11/xkeysyms.py

keys = [
    Key(key[0], key[1], *key[2:])
    for key in [
        # ------------ Window Configs ------------
        (
            [mod],
            "BackSpace",
            lazy.spawn("/usr/bin/xautolock -locknow"),
        ),
        (
            [mod, "shift"],
            "BackSpace",
            lazy.spawn("/home/starkers/.config/i3/scripts/i3suspend.sh"),
        ),
        #
        # groups
        #
        # ([mod], "Tab", lazy.screen.next_group()),
        # Switch between windows in current stack pane
        # ([mod], "Down", lazy.layout.down()),
        ([mod], "j", lazy.layout.down()),
        # ([mod], "Up", lazy.layout.up()),
        ([mod], "k", lazy.layout.up()),
        # ([mod], "Left", lazy.layout.left()),
        ([mod], "h", lazy.layout.left()),
        # ([mod], "Right", lazy.layout.right()),
        ([mod], "l", lazy.layout.right()),
        # Change window sizes (MonadTall)
        ([mod, "shift"], "l", lazy.layout.grow()),
        # ([mod, "shift"], "Right", lazy.layout.grow()),
        ([mod, "shift"], "h", lazy.layout.shrink()),
        # ([mod, "shift"], "Left", lazy.layout.shrink()),
        # Toggle lfloating
        ([mod, "shift"], "f", lazy.window.toggle_floating()),
        ([mod], "f", lazy.window.toggle_fullscreen()),
        # Move windows up or down in current stack
        ([mod, "shift"], "j", lazy.layout.shuffle_down()),
        # ([mod, "shift"], "Down", lazy.layout.shuffle_down()),
        ([mod, "shift"], "k", lazy.layout.shuffle_up()),
        # ([mod, "shift"], "Up", lazy.layout.shuffle_up()),
        # Toggle between different layouts as defined below
        ([mod], "grave", lazy.next_layout()),
        ([mod, "shift"], "grave", lazy.prev_layout()),
        # Kill window
        ([mod], "w", lazy.window.kill()),
        # Switch focus of monitors
        ([mod], "period", lazy.next_screen()),
        ([mod], "comma", lazy.prev_screen()),
        # Restart Qtile
        ([mod, "control"], "r", lazy.restart()),
        ([mod, "control"], "q", lazy.shutdown()),  # quit
        ([mod], "r", lazy.spawncmd()),
        # ------------ App Configs ------------
        #
        # ([mod], "space", lazy.spawn("copyq show")),
        ([mod], "space", lazy.spawn("rofi-gpaste")),
        ([mod], "Escape", lazy.spawn("rofi -show window")),
        ([mod], "d", lazy.spawn("rofi -show drun")),
        # Window Nav
        ([mod, "shift"], "m", lazy.spawn("rofi -show")),
        # # Browser
        # ([mod], "b", lazy.spawn("firefox")),
        # File Explorer
        ([mod], "e", lazy.spawn("rof emoji")),
        # Terminal
        ([mod], "Return", lazy.spawn("alacritty")),
        # # Redshift
        # ([mod], "r", lazy.spawn("redshift -O 2400")),
        # ([mod, "shift"], "r", lazy.spawn("redshift -x")),
        # Screenshot
        # ([mod], "s", lazy.spawn("flameshot full")),
        ([mod, "shift"], "s", lazy.spawn("flameshot gui")),
        #
        # ------------ Hardware Configs ------------
        # Volume
        (
            [],
            "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        ),
        (
            [],
            "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        ),
        (
            [],
            "XF86AudioMute",
            lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
        ),
        (
            [],
            "XF86AudioPlay",
            lazy.spawn("playerctl play-pause"),
        ),
        (
            [],
            "XF86AudioNext",
            lazy.spawn("playerctl next"),
        ),
        (
            [],
            "XF86AudioPrev",
            lazy.spawn("playerctl previous"),
        ),
        # Brightness
        ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
        ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    ]
]

keys += [
    Key([mod], "Tab", lazy.screen.toggle_group()),
    Key([mod], "bracketleft", lazy.screen.prev_group()),
    Key([mod], "bracketright", lazy.screen.next_group()),
]
