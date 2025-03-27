{ pkgs, ... }:

let 
  theme-fish = pkgs.fetchFromGitHub { 
    owner = "aneveux"; 
    repo = "theme-harleen"; 
    rev = "caf53d792038e78faa7b6b6b98669abc171c5e64"; 
    hash = "sha256-DHGjy7UGzy+vuzHrw49KP0nePKvx7sMMMrPj2mbGoJA="; 
  }; 
  git-func = pkgs.fetchFromGitHub {
    owner = "oh-my-fish";
    repo = "oh-my-fish";
    rev = "0a3258447685d4437f040174fbb8b7eed8bc62de";
    hash = "sha256-Z1fuy7uDVAxJ6gFqpxSpYnZeEinej7qUqVXgOIPqovY=";
  };
in 
{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      c = "clear";
      l = "eza -lah";
      b = "broot";
      h = "hx";
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true; 
  };
  programs.zathura.enable = true;
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.broot = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };

  # i hate this but i have no idea how to make it simple & readable
  xdg.configFile."fish/functions/git_ahead.fish".source = "${git-func}/lib/git/git_ahead.fish"; 
  xdg.configFile."fish/functions/git_branch_name.fish".source = "${git-func}/lib/git/git_branch_name.fish"; 
  xdg.configFile."fish/functions/git_is_dirty.fish".source = "${git-func}/lib/git/git_is_dirty.fish"; 
  xdg.configFile."fish/functions/git_is_repo.fish".source = "${git-func}/lib/git/git_is_repo.fish"; 
  xdg.configFile."fish/functions/git_is_staged.fish".source = "${git-func}/lib/git/git_is_staged.fish"; 
  xdg.configFile."fish/functions/git_is_stashed.fish".source = "${git-func}/lib/git/git_is_stashed.fish"; 
  xdg.configFile."fish/functions/git_is_touched.fish".source = "${git-func}/lib/git/git_is_touched.fish"; 
  xdg.configFile."fish/functions/git_is_worktree.fish".source = "${git-func}/lib/git/git_is_worktree.fish"; 
  xdg.configFile."fish/functions/git_untracked.fish".source = "${git-func}/lib/git/git_untracked.fish"; 

  xdg.configFile."fish/functions/fish_greeting.fish".source = "${theme-fish}/fish_greeting.fish"; 
  xdg.configFile."fish/functions/fish_prompt.fish".source = "${theme-fish}/fish_prompt.fish"; 
  xdg.configFile."fish/functions/fish_right_prompt.fish".source = "${theme-fish}/fish_right_prompt.fish"; 
  xdg.configFile."fish/functions/fish_title.fish".source = "${theme-fish}/fish_title.fish"; 
}
