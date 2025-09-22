{ ... }:

let
  icons = rec {
    calendar = "󰃭 ";
    clock = " ";
    battery.charging = "󱐋";
    battery.horizontal = [
      " "
      " "
      " "
      " "
      " "
    ];
    battery.vertical = [
      "󰁺"
      "󰁻"
      "󰁼"
      "󰁽"
      "󰁾"
      "󰁿"
      "󰂀"
      "󰂁"
      "󰂂"
      "󰁹"
    ];
    battery.levels = battery.vertical;
    network.disconnected = "󰤮 ";
    network.ethernet = "󰈀 ";
    network.strength = [
      "󰤟 "
      "󰤢 "
      "󰤥 "
      "󰤨 "
    ];
    volume.source = "󱄠";
    volume.muted = "󰝟";
    volume.levels = [
      "󰕿"
      "󰖀"
      "󰕾"
    ];
    idle.on = "󰈈 ";
    idle.off = "󰈉 ";
    vpn = "󰌆 ";
  };
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings.main = {
      layer = "top";
      width = 40;
      position = "left";
      modules-left = [
        "idle_inhibitor"
        "niri/workspaces"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "niri/language"
        "wireplumber"
        "wireplumber#source"
        "network"
        "battery"
      ];
      battery = {
        interval = 5;
        format = "{icon} {capacity}%";
        format-charging = "{icon}  {capacity}% ${icons.battery.charging}";
        format-icons = icons.battery.levels;
        states.warning = 30;
        states.critical = 15;
      };
      clock = {
        interval = 1;
        format = "{:%H\n%M\n%S}";
      };
      network = {
        tooltip-format = "{ifname}";
        format-disconnected = icons.network.disconnected;
        format-ethernet = icons.network.ethernet;
        format-wifi = "{icon}";
        format-icons = icons.network.strength;
      };
      wireplumber = {
        format = "{icon} {volume}%";
        format-muted = "${icons.volume.muted} {volume}%";
        format-icons = icons.volume.levels;
        reverse-scrolling = 1;
        tooltip = false;
      };
      "niri/language" = {
        format = "{short}";
      };
      "wireplumber#source" = {
        node-type = "Audio/Source";
        format = "${icons.volume.source}";
        format-muted = "${icons.volume.muted}";
        tooltip = false;
      };
      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = icons.idle.on;
          deactivated = icons.idle.off;
        };
      };
    };
  };
}
