{ pkgs, ... }:

{
  home.packages = [
    pkgs.blesh
  ];
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.bash = {
    enable = true;
    bashrcExtra = ''
    if [[ $- == *i* ]]; then
      # set -o vi
      source "$(blesh-share)"/ble.sh --noattach
    fi

    export PROMPT_SPACE="master"

    # alias ll="${pkgs.eza}/bin/eza -l --git --icons"
    # alias cat=${pkgs.bat}/bin/bat

    source ${pkgs.fzf}/share/fzf/completion.bash
    source ${pkgs.fzf}/share/fzf/key-bindings.bash
          
    export EZA_ICON_SPACING=2

    blehook PRECMD-+=__prompt_precmd
    __prompt_precmd() {
      PS1='\e[33m[$PROMPT_SPACE]\e[0m \e[34m\u:\w \$\e[0m '
    }
    # eval "$(${pkgs.atuin}/bin/atuin init bash)"

    [[ ! ''${BLE_VERSION-} ]] || ble-attach

    '';
  };
}
