{ ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      on_force_close = "quit";
      simplified_ui = true;
      theme = "ansi";
      pane_frames = false;
      copy_on_select = false;
      show_startup_tips = false;
      show_release_notes = false;
    };
  };
}
