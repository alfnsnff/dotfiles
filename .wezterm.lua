-- ~/.wezterm.lua
local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- =====================
-- Window size
-- =====================
config.initial_rows = 35
config.initial_cols = 120

-- =====================
-- Disable TAB BAR (total)
-- =====================
config.enable_tab_bar = false

-- =====================
-- Colors
-- =====================
config.colors = {
  foreground = "#CBE0F0",
  background = "#011423",

  cursor_bg = "#47FF9C",
  cursor_border = "#47FF9C",
  cursor_fg = "#011423",

  selection_bg = "#033259",
  selection_fg = "#CBE0F0",

  ansi = {
    "#1E1E2E",
    "#F38BA8",
    "#44FFB1",
    "#F9E2AF",
    "#CBE0F0",
    "#44FFB1",
    "#94E2D5",
    "#CDD6F4",
  },

  brights = {
    "#313244",
    "#F38BA8",
    "#47FF9C",
    "#F9E2AF",
    "#CBE0F0",
    "#CBA6F7",
    "#94E2D5",
    "#FFFFFF",
  },
}

-- =====================
-- Fonts
-- =====================
config.font = wezterm.font_with_fallback({
  { family = "Fira Code", weight = "Regular" },
  { family = "Symbols Nerd Font Mono", scale = 0.8 },
})
config.font_size = 15

-- =====================
-- Window visuals
-- =====================
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.85
config.macos_window_background_blur = 30
config.window_close_confirmation = "NeverPrompt"

-- =====================
-- Keybindings
-- =====================
config.keys = {
  -- App
  { key = "q", mods = "CMD", action = act.QuitApplication },

  -- Copy / Paste
  { key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },

  -- Word navigation (⌥← / ⌥→)
  { key = "LeftArrow",  mods = "OPT", action = act.SendKey({ key = "b", mods = "ALT" }) },
  { key = "RightArrow", mods = "OPT", action = act.SendKey({ key = "f", mods = "ALT" }) },

  -- Line navigation (⌘← / ⌘→)
  { key = "LeftArrow",  mods = "CMD", action = act.SendKey({ key = "a", mods = "CTRL" }) },
  { key = "RightArrow", mods = "CMD", action = act.SendKey({ key = "e", mods = "CTRL" }) },

  -- Delete whole line
  { key = "Backspace", mods = "CMD", action = act.SendKey({ key = "u", mods = "CTRL" }) },

  -- Pane splits
  { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "D", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

  -- Pane navigation
  { key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },

  -- Close pane
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
}

return config
