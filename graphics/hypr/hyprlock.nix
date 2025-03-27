{ config, ... }:

{
programs.hyprlock = {
  enable = true;
  settings = {
    general = {
      disable_loading_bar = false;
      grace = 0;
      ignore_empty_input = true;
      hide_cursor = true;
    };

    background = {
      monitor = "";
      path = "screenshot";
      color = "0x${config.colorScheme.palette.base01}ff";
      blur_passes = 3;
      blur_size = 10;
    };

    input-field = {
      monitor = "";
      outline_thickness = 3;
      inner_color = "0x${config.colorScheme.palette.base00}ff";
      check_color = "0x${config.colorScheme.palette.base09}ff";
      fail_color = "0x${config.colorScheme.palette.base08}ff";

      placeholder_text = "passwd";
      fail_timeout = 500;

      font_color = "0x${config.colorScheme.palette.base06}ff";
      fade_on_empty = false;
      rounding = 15;
      halign = "center";
      valign = "center";
    };

    label = {
      monitor = "";
      text = "hi $USER, it's $TIME12";
      color = "0x${config.colorScheme.palette.base07}ff";
      font_size = 25;
      position = "0, 80";
      halign = "center";
      valign = "center";
    };
  };
  };
}
