{ config, ... }:

{
  programs.wezterm = {
    enable = true;
    colorSchemes = {
      nix-taken = {
        ansi = [
          "#${config.colorScheme.palette.base00}"
          "#${config.colorScheme.palette.base08}"
          "#${config.colorScheme.palette.base0B}"
          "#${config.colorScheme.palette.base0A}"
          "#${config.colorScheme.palette.base0D}"
          "#${config.colorScheme.palette.base0E}"
          "#${config.colorScheme.palette.base0C}"
          "#${config.colorScheme.palette.base05}"
        ];
        brights = [
          "#${config.colorScheme.palette.base03}"
          "#${config.colorScheme.palette.base08}"
          "#${config.colorScheme.palette.base0B}"
          "#${config.colorScheme.palette.base0A}"
          "#${config.colorScheme.palette.base0D}"
          "#${config.colorScheme.palette.base0E}"
          "#${config.colorScheme.palette.base0C}"
          "#${config.colorScheme.palette.base07}"
        ];
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base05}";
        cursor_bg = "#${config.colorScheme.palette.base05}";
        cursor_border = "#${config.colorScheme.palette.base05}";
        cursor_fg = "#${config.colorScheme.palette.base00}";
        selection_bg = "#${config.colorScheme.palette.base01}";
        selection_fg = "#${config.colorScheme.palette.base05}";
      };
    };

    extraConfig = ''

local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font('Mononoki Nerd Font Mono', { weight = 'Bold' });
config.enable_tab_bar = false
config.font_size = 10.0
config.color_scheme = 'nix-taken'
config.disable_default_key_bindings = true
local mod = {}
local act = wezterm.action
mod.SUPER = 'ALT'
mod.CSUPER = 'CTRL|ALT'
config.keys = {
   -- misc/useful --
   { key = 'F1', mods = mod.SUPER, action = 'ActivateCopyMode' },
   { key = 'F2', mods = mod.SUPER, action = act.ActivateCommandPalette },
   { key = 'F3', mods = mod.SUPER, action = act.ShowLauncher },
   { key = 'F4', mods = mod.SUPER, action = act.ShowLauncherArgs({ flags = 'FUZZY|TABS' }) },

   -- copy/paste --
   { key = 'c',          mods = 'CTRL|SHIFT',  action = act.CopyTo('Clipboard') },
   { key = 'v',          mods = 'CTRL|SHIFT',  action = act.PasteFrom('Clipboard') },

   -- tabs --
   -- tabs: spawn+close
   { key = 't',          mods = mod.SUPER,     action = act.SpawnTab('DefaultDomain') },
   { key = 'w',          mods = mod.SUPER,     action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation
   { key = '[',          mods = mod.SUPER,     action = act.ActivateTabRelative(-1) },
   { key = ']',          mods = mod.SUPER,     action = act.ActivateTabRelative(1) },

   -- tab: title
   { key = '0',          mods = mod.SUPER,     action = act.EmitEvent('tabs.manual-update-tab-title') },

   -- tab: hide tab-bar
   { key = '9',          mods = mod.SUPER,     action = act.EmitEvent('tabs.toggle-tab-bar'), },

   -- window --
   -- window: spawn windows
   { key = 'n',          mods = mod.SUPER,     action = act.SpawnWindow },

   {
      key = '=',
      mods = mod.SUPER,
      action = act.IncreaseFontSize
   },
   {
      key = '-',
      mods = mod.SUPER,
      action = act.DecreaseFontSize
   },
   -- panes --

   -- panes: split panes
   {
      key = "v",
      mods = mod.CSUPER,
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = "h",
      mods = mod.CSUPER,
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
   },

   -- panes: zoom+close pane
   { key = 'Enter', mods = mod.SUPER,     action = act.TogglePaneZoomState },
   { key = 'w',     mods = mod.SUPER,     action = act.CloseCurrentPane({ confirm = false }) },

   -- panes: navigation
   { key = 'UpArrow',        mods = mod.SUPER, action = act.ActivatePaneDirection('Up') },
   { key = 'DownArrow',      mods = mod.SUPER, action = act.ActivatePaneDirection('Down') },
   { key = 'LeftArrow',       mods = mod.SUPER, action = act.ActivatePaneDirection('Left') },
   { key = 'RightArrow',     mods = mod.SUPER, action = act.ActivatePaneDirection('Right') },
   {
      key = 'p',
      mods = mod.SUPER,
      action = act.PaneSelect({ alphabet = '1234567890', mode = 'SwapWithActiveKeepFocus' }),
   },

   -- panes: scroll pane
   { key = 'u',        mods = mod.SUPER, action = act.ScrollByLine(-5) },
   { key = 'd',        mods = mod.SUPER, action = act.ScrollByLine(5) },
   { key = 'PageUp',   mods = 'NONE',    action = act.ScrollByPage(-0.75) },
   { key = 'PageDown', mods = 'NONE',    action = act.ScrollByPage(0.75) },
}

return config
    '';
  };
}
