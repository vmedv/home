{ config, colorMode, ... }:
let
  modePic = "~/.config/home-manager/wallpaper-${config.colorMode}.jpg";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        # "./wallpaper-light.jpg"
        # "~/.config/home-manager/wallpaper-1.jpg"
        # "~/.config/home-manager/wallpaper-light-1.jpg"
        modePic
      ];
      wallpaper = [ 
        # "eDP-1, ~/.config/home-manager/wallpaper-1.jpg" 
        # "DP-1, ~/.config/home-manager/wallpaper-1.jpg" 
        "eDP-1, ${modePic}"
        "DP-1, ${modePic}"
      ];
    };
  };
}
