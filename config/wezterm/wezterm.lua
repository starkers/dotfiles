local wezterm = require 'wezterm';

return {
  -- color_scheme = "Dracula",
  -- color_scheme = "OceanicMaterial",
  color_scheme = "OneHalfDark",
  -- color_scheme = "AtomOneLight",
  font = wezterm.font("ComicCode Nerd Font"),
  keys = {

    -- see: https://github.com/wez/wezterm/blob/main/docs/config/default-keys.md

    { key = "_", mods = "CTRL", action = "DisableDefaultAssignment" }, -- this is to stop wezterm intercepting CTRL+/

    { key = "e", mods = "CTRL|SHIFT",
      action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "o", mods = "CTRL|SHIFT", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "j", mods = "CTRL|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 1 } } },
    { key = "k", mods = "CTRL|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 1 } } },
    { key = "h", mods = "CTRL|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 1 } } },
    { key = "l", mods = "CTRL|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 1 } } },

    { key = "j", mods = "ALT", action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "k", mods = "ALT", action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "h", mods = "ALT", action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "l", mods = "ALT", action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "x", mods = "CTRL|SHIFT", action = "TogglePaneZoomState" },
  },

  -- use_fancy_tab_bar = false,
  -- tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  -- debug_key_events = true,
}
