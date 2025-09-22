{ config, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        # terminal = "${pkgs.ghostty}/bin/ghostty -e ";
        use-bold = true;
        prompt = "\"󰘧 \"";
        layer = "overlay";
        vertical-pad = 16;
        width = 40;
      };
      border = {
        radius = 2;
      };
      colors = {
        background = "${config.colorScheme.palette.base01}fa";
        text = "${config.colorScheme.palette.base07}ff";
        prompt = "${config.colorScheme.palette.base07}ff";
        input = "${config.colorScheme.palette.base06}ff";
        match = "${config.colorScheme.palette.base08}ff";
        selection = "${config.colorScheme.palette.base04}fa";
        selection-text = "${config.colorScheme.palette.base07}ff";
        selection-match = "${config.colorScheme.palette.base08}ff";
        counter = "${config.colorScheme.palette.base08}ff";
        border = "${config.colorScheme.palette.base08}ff";
      };
    };
  };
}
