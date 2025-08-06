{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    clearDefaultKeybinds = true;
    settings = {
      font-family = "Mononoki Nerd Font Mono";
      font-size = 10;
      cursor-style = "bar";
      cursor-style-blink = true;
      window-padding-x = 10;
      window-padding-y = 10;
      window-padding-balance = true;
      window-decoration = "none";
      window-new-tab-position = "current";
      clipboard-read = "allow";
      clipboard-write = "allow";
      shell-integration = "detect";
      auto-update = "off";
      keybind = [
        "performable:alt+equal=increase_font_size:1"
        "performable:alt+minus=decrease_font_size:1"
        "performable:alt+slash=reset_font_size"
        "unconsumed:performable:ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        "performable:alt+t=new_tab"
        "performable:alt+right=next_tab"
        "performable:alt+left=previous_tab"
        "performable:alt+backslash=toggle_tab_overview"
        "alt+ctrl+k=new_split:up"
        "alt+ctrl+j=new_split:down"
        "alt+ctrl+h=new_split:left"
        "alt+ctrl+l=new_split:right"
        "performable:alt+k=goto_split:up"
        "performable:alt+j=goto_split:down"
        "performable:alt+h=goto_split:left"
        "performable:alt+l=goto_split:right"
        "alt+z=toggle_split_zoom"
        "alt+c=toggle_quick_terminal"
      ];
    };
  };
}
