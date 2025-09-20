{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

{
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];

  packages = [
    pkgs.xwayland-satellite-unstable
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      focus-ring = {
        enable = true;
        width = 10000;
        active.color = "#00000055";
      };
      tab-indicator = {
        position = "top";
        gaps-between-tabs = 10;
        # hide-when-single-tab = true;
        place-within-column = true;
        active.color = "red";
      };

      clipboard.disable-primary = true;
      binds = with config.lib.niri.actions; {
        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
        "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK" "toggle";
        "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE" "toggle";
        "XF86MonBrightnessUp".action = spawn "brightnessctl" "s" "10%+";
        "XF86MonBrightnessDown".action = spawn "brightnessctl" "s" "10%-";

        "Mod+Space".action = spawn "fuzzel";
        "Mod+Enter".action = spawn "wezterm";
        "Mod+Lock".action = spawn "swaylock";

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;

        "Mod+Shift+1".action = move-column-to-index 1;
        "Mod+Shift+2".action = move-column-to-index 2;
        "Mod+Shift+3".action = move-column-to-index 3;
        "Mod+Shift+4".action = move-column-to-index 4;
        "Mod+Shift+5".action = move-column-to-index 5;
        "Mod+Shift+6".action = move-column-to-index 6;
        "Mod+Shift+7".action = move-column-to-index 7;
        "Mod+Shift+8".action = move-column-to-index 8;
        "Mod+Shift+9".action = move-column-to-index 9;

        "Mod+Shift+Q".action = quit;

        "Mod+Plus".action = set-column-width "+10%";
        "Mod+Minus".action = set-column-width "-10%";

        "Print".action = screenshot { show-pointer = true; };
        "Mod+Print".action = screenshoot-window;
        "Mod+Q".action = close-window;
        "Mod+M".action = toggle-windowed-fullscreen;

        "Mod+Left".action = focus-window-or-monitor-left;
        "Mod+Right".action = focus-window-or-monitor-right;
        "Mod+Up".action = focus-window-or-monitor-up;
        "Mod+Down".action = focus-window-or-monitor-down;

        "Mod+C".action = center-window;
        "Mod+F".action = toggle-window-floating;
        "Mod+O".action = toggle-overview;
      };
      screenshot-path = "~/screenshots";
      hotkey-overlay.skip-at-startup = true;
      spawn-at-startup = [
        { argv = [ "zen" ]; }
        { argv = [ "telegram-desktop" ]; }
        { argv = [ "spotify" ]; }
      ];
      input = {
        focus-follows-mouse.enable = true;
        keyboard = {
          repeat-delay = 150;
          repeat-rate = 25;
          xkb.layout = "us, ru";
          xkb.options = "grp:alt_shift_toggle";
        };
        mod-key = "Super";
        touchpad = {
          click-method = "clickfinger";
          dwt = true;
        };
      };
      layout = {
        border = {
          enable = true;
          width = 5;
          active = "rgb(255 0 0)";
          inactive = "rgb(24 24 24)";
        };
      };
      xwayland-satellite.path = "${lib.getExe pkgs.xwayland-satellite-unstable}";
    };
  };

}
