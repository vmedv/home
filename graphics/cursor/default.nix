{ pkgs, ... }:

{
  gtk.cursorTheme = {
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    size = 24;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
  };
}
