# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# from libqtile import layout
from libqtile.config import Match
from libqtile.layout.bsp import Bsp
from libqtile.layout.columns import Columns
from libqtile.layout.floating import Floating
from libqtile.layout.matrix import Matrix
from libqtile.layout.max import Max
from libqtile.layout.ratiotile import RatioTile

# from libqtile.layout.screensplit import ScreenSplit
# from libqtile.layout.slice import Slice
# from libqtile.layout.spiral import Spiral
# from libqtile.layout.stack import Stack
from libqtile.layout.tile import Tile
from libqtile.layout.tree import TreeTab
from libqtile.layout.verticaltile import VerticalTile
from libqtile.layout.xmonad import MonadTall, MonadWide
from libqtile.layout.zoomy import Zoomy

from .theme import colors

# from libqtile.layout.xmonad import MonadThreeCol


# Layouts and layout rules


layout_conf = {
    "border_focus": colors["focus"][0],
    "border_width": 2,
    "margin": 6,
}

layouts = [
    Max(),
    MonadTall(**layout_conf),
    MonadWide(**layout_conf),
    Bsp(**layout_conf),
    Matrix(columns=2, **layout_conf),
    RatioTile(**layout_conf),
    Columns(),
    Tile(),
    TreeTab(),
    VerticalTile(),
    Zoomy(),
]

floating_layout = Floating(
    float_rules=[
        *Floating.default_float_rules,
        Match(wm_class="copyq"),
        Match(wm_class="flameshot"),
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(wm_class="beyond-all-reason"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ],
    border_focus=colors["color4"][0],
)
