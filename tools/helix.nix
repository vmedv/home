{ config, ... }:

{
  
  programs.helix = {
    enable = true;
    settings = {
      theme = "nix-taken";
      editor.statusline = {
        left = ["mode" "spinner"];
        center = ["file-name" "version-control"];
        right = ["diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type"];
        separator = "│";
        mode.normal = "NORMAL";
        mode.insert = "INSERT";
        mode.select = "SELECT";
      };
      editor.file-picker.hidden = false;
      editor.whitespace.render = "all";
      editor.indent-guides.render = true;
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };

    themes = {
      nix-taken = let
        transparent = "none";
        gray = "#${config.colorScheme.palette.base03}";
        dark-gray = "#${config.colorScheme.palette.base02}";
        white = "#${config.colorScheme.palette.base07}";
        black = "#${config.colorScheme.palette.base00}";
        red = "#${config.colorScheme.palette.base08}";
        orange = "#${config.colorScheme.palette.base09}";
        yellow = "#${config.colorScheme.palette.base0A}";
        green = "#${config.colorScheme.palette.base0B}";
        blue = "#${config.colorScheme.palette.base0D}";
        magenta = "#${config.colorScheme.palette.base0E}";
        cyan = "#${config.colorScheme.palette.base0C}";
      in {
        "ui.menu" = transparent;
        "ui.menu.selected" = { modifiers = [ "reversed" ]; };
        "ui.linenr" = { fg = gray; bg = dark-gray; };
        "ui.popup" = { modifiers = [ "reversed" ]; };
        "ui.linenr.selected" = { fg = white; bg = black; modifiers = [ "bold" ]; };
        "ui.selection" = { fg = black; bg = blue; };
        "ui.selection.primary" = { modifiers = [ "reversed" ]; };
        "comment" = { fg = gray; };
        "ui.statusline" = { fg = white; bg = dark-gray; };
        "ui.statusline.inactive" = { fg = dark-gray; bg = white; };
        "ui.help" = { fg = dark-gray; bg = white; };
        "ui.cursor" = { modifiers = [ "reversed" ]; };
        "variable" = red;
        "variable.builtin" = orange;
        "constant.numeric" = orange;
        "constant" = orange;
        "attributes" = yellow;
        "type" = yellow;
        "ui.cursor.match" = { fg = yellow; modifiers = [ "underlined" ]; };
        "string" = green;
        "variable.other.member" = red;
        "constant.character.escape" = cyan;
        "function" = blue;
        "constructor" = blue;
        "special" = blue;
        "keyword" = magenta;
        "label" = magenta;
        "namespace" = blue;
        "diff.plus" = green;
        "diff.delta" = yellow;
        "diff.minus" = red;
        "diagnostic" = { modifiers = [ "underlined" ]; };
        "ui.gutter" = { bg = black; };
        "info" = blue;
        "hint" = dark-gray;
        "debug" = dark-gray;
        "warning" = yellow;
        "error" = red;
      };
    };
  };
}
