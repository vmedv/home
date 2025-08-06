{ pkgs, ... }:

{
  imports = [
    ./bash.nix
  ];
  
  services.clipman.enable = true;
  
  home.packages = with pkgs; [
    ripgrep
    htop
    libnotify
    dunst
    killall
    jq
    zip
    xclip
    unzip
    acpi
    upower
    wl-clipboard
    numix-icon-theme
    brightnessctl
    pavucontrol

    nil
  ];
  
  programs.git = {
    enable = true;
    userName = "ivan medvedev";
    userEmail = "vmedvedev1017@gmail.com";
    delta.enable = true;
  };
}
