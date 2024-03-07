from libqtile.command import lazy

# from libqtile.config import Click
from libqtile.config import Drag

from .keys import mod

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod],
        "Button3",  # seems to be right click on touchpad
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    # Click(
    #     [mod],
    #     "Button2",
    #     lazy.window.bring_to_front(),
    # ),
]
