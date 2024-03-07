from libqtile.command import lazy
from libqtile.config import Group, Key

from .keys import keys, mod

groups = []
groups = [
    Group(name="  "),
    Group(name="  "),
    Group(name="  "),
    Group(name="  "),
    Group(name=" 󰽰 "),
    Group(name="  "),
    Group(name="  "),
]


for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend(
        [
            # Switch to workspace N
            Key([mod], actual_key, lazy.group[group.name].toscreen()),
            # Send window to workspace N
            Key([mod, "shift"], actual_key, lazy.window.togroup(group.name)),
            # TODO: should move to next window.. maybe store func else where
            # and configure in keys.py
            # Key(
            #     [mod, "shift"],
            #     "Right",
            #     lazy.function(window_to_next_screen, switch_screen=True),
            # ),
            # Key(
            #     [mod, "shift"],
            #     "Left",
            #     lazy.function(window_to_previous_screen, switch_screen=True),
            # ),
        ]
    )
