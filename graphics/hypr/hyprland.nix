{ pkgs, config, ... }:

{
  enable = true;
  plugins = with pkgs.hyprlandPlugins; [
    hyprspace
    hyprsplit
  ];
  settings = {
    # vars
    "$mod" = "SUPER";
    "$browser" = "zen";
    "$term" = "wezterm";
    "$run" = "fuzzel";

    env = [
      "HYPRCURSOR_SIZE,24"
    ];

    #monitors
    monitor = ",preferred,auto,1";

    # autostart
    exec-once = [
      "$browser"
      "telegram-desktop"
      "spotify"
      "systemctl --user start hyprpolkitagent"
      "dunst"
      "eww daemon"
      "eww open master-bar"
      "eww open slave-bar"
      "hyprctl setcursor cursors Bibata-Modern-Ice 24"
    ];

    general = {
      border_size = 2;
      no_border_on_floating = false;

      gaps_in = 5;
      gaps_out = 7;

      "col.active_border" = "0xff${config.colorScheme.palette.base07}";
      "col.inactive_border" = "0xff${config.colorScheme.palette.base02}";

      resize_on_border = true;
      extend_border_grab_area = 20;
      hover_icon_on_border = true;

      allow_tearing = false;

      layout = "dwindle";

      snap = {
        enabled = true;
        window_gap = 30;
        monitor_gap = 30;
      };
    };

    decoration = {
      rounding = 5;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;

      shadow.enabled = false;

      blur.enabled = false;
    };

    cursor = {
      enable_hyprcursor = false;
    };

    animations = {
      enabled = true;

      bezier = [
        "easeOutQuint,0.23,1,0.32,1"
        "easeOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];

      animation = [
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, linear, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 3.81, easeOutQuint"
        "layersIn, 1, 4, easeOutQuint, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 1, 1.94, default, slide"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
      vfr = true;
    };

    input = {
      kb_layout = "us, ru";
      kb_options = "grp:alt_shift_toggle";

      repeat_rate = 25;
      repeat_delay = 150;

      follow_mouse = 1;

      sensitivity = 0;

      touchpad = {
        disable_while_typing = true;
        natural_scroll = false;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_distance = 200;
      workspace_swipe_invert = false;
      workspace_swipe_use_r = true;
    };

    bind = [
      "$mod, Return, exec, $term"
      "$mod, Q, killactive,"
      "$mod SHIFT, P, exit,"
      "$mod, F, togglefloating,"
      "$mod, Space, exec, $run"
      "$mod, P, pseudo,"
      "$mod, L, exec, hyprlock"
      "$mod, J, togglesplit,"
      "$mod, M, fullscreen, 1"
      "$mod SHIFT, M, fullscreen, 0"
      "$mod, O, overview:toggle, all"
      "$mod, G, split:grabroguewindows"

      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      "$mod, 1, split:workspace, 1"
      "$mod, 2, split:workspace, 2"
      "$mod, 3, split:workspace, 3"
      "$mod, 4, split:workspace, 4"
      "$mod, 5, split:workspace, 5"
      "$mod, 6, split:workspace, 6"

      "$mod SHIFT, 1, split:movetoworkspace, 1"
      "$mod SHIFT, 2, split:movetoworkspace, 2"
      "$mod SHIFT, 3, split:movetoworkspace, 3"
      "$mod SHIFT, 4, split:movetoworkspace, 4"
      "$mod SHIFT, 5, split:movetoworkspace, 5"
      "$mod SHIFT, 6, split:movetoworkspace, 6"

      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"

      "$mod, mouse_down, workspace, r+1"
      "$mod, mouse_up, workspace, r-1"

      "          , Print, exec, hyprshot -m region --clipboard-only"
      "$mod      , Print, exec, hyprshot -m window --clipboard-only"
      "$mod SHIFT, Print, exec, hyprshot -m output --clipboard-only"
    ];
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];
    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", switch:Lid Switch, exec, hyprlock && systemd suspend"
    ];

    windowrule = [
      "float, class:^(org.pulseaudio.pavucontrol)$"
      "center, class:^(org.pulseaudio.pavucontrol)$"
      "size 800 500, class:^(org.pulseaudio.pavucontrol)$"
    ];

    windowrulev2 = [
      "noanim, class:^(org.telegram.desktop)$, title:^(Media viewer)$"
      "float, class:^(org.telegram.desktop)$, title:^(Media viewer)$"

      "float, class:^(zen)$, title:^(Picture-in-Picture)$"
      "size 480 270, class:^(zen)$, title:^(Picture-in-Picture)$"
      "move 1400 780, class:^(zen)$, title:^(Picture-in-Picture)$"
      "pin, class:^(zen)$, title:^(Picture-in-Picture)$"
      "nodim, class:^(zen)$, title:^(Picture-in-Picture)$"

      "workspace 3 silent, class:^(org.telegram.desktop)$"
      "workspace 4 silent, class:^(Spotify)$"

      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
  };
}
