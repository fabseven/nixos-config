{ lib, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Fabseven";
        email = "fabbycrafted@gmail.com";
      };
      core = {
        editor = "nvim";
        whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      };
      diff.tool = "meld";
      web.browser = "google-chrome-stable";
      push.default = "tracking";
      push.autoSetupRemote = true;
      pull.rebase = false;
      rebase.autoStash = true;
      branch.autosetupmerge = true;
      init.defaultBranch = "master";
      rerere.enabled = true;
      color.ui = true;
      blame.date = "relative";
      alias = {
        l =
          let
            format = "%Cred%h%Creset %Cblue%ad%Creset %Cgreen%an%Creset %s";
          in
          ''log --pretty=format:"${format}"'';
      };
    };
    ignores = [
      ".idea"
      ".venv"
      ".env"
    ];
  };

  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.zsh.shellAliases = lib.mkAfter {
    "lg" = "lazygit";
    "g" = "git";
    "gs" = "git status";
    "ga" = "git add -A";
    "gf" = "git fetch";
    "gp" = "git push";
    "gl" = "git pull";
    "glr" = "git pull --rebase";
    "gc" = "git commit -v";
    "gca" = "git commit --amend";
    "gch" = "git commit --amend -C HEAD";
    "gac" = "git commit -av";
    "gb" = "git branch -v";
    "gba" = "git branch -va";
    "gcp" = "git cherry-pick";
    "glo" = "git l";
    "gco" = "git checkout";
    "gm" = "git merge";
    "gmt" = "git mergetool --no-prompt";
    "gd" = "git diff";
    "gr" = "git remote -v";
    "gcf" = "git clean -f";
    "grh" = "git reset --hard";
    "grhh" = "git reset --hard HEAD";
  };
}
