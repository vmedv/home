{ pkgs, ... }:

{
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
    wl-clipboard

    brightnessctl
    pavucontrol
  ];
  
  programs.git = {
    enable = true;
    userName = "ivan medvedev";
    userEmail = "vmedvedev1017@gmail.com";
    delta.enable = true;
  };
}
