{
  enable = true;
  settings = {
    general = {
      before_sleep_cmd = "loginctl lock-session";
      after_sleep_cmd = "hyprctl dispatch dpms on";
      lock_cmd = "pidof hyprlock || hyprlock";
      ignore_dbus_inhibit = false;
    };
    listener = [
    {
      timeout = 300;
      on-timeout = "loginctl lock-session";
    }
    {
      timeout = 600;
      on-timeout = ''[ "$(acpi -a | cut -d \: -f 2 | tr -d \ )" = "off-line" ] && systemctl suspend'';
    }
    ];
  };
}
