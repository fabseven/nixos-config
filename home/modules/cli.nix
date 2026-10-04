{ config, ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    # defaultCommand = "fd --type f'";
    defaultCommand = "rg --files --hidden";
    defaultOptions = [ "--bind=ctrl-e:up" ];
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.bat = {
    enable = true;
  };
  # man with bat
  home.sessionVariables = {
    BAT_THEME = "ansi";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
  programs.ripgrep = {
    enable = true;
  };
  programs.btop = {
    enable = true;
    settings = {
      proc_per_core = true;
      update_ms = 200;
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      character = {
        success_symbol = "[❯](bold cyan)";
        error_symbol = "[✗](bold cyan)";
      };

      # Omarchy prompt: directory + git branch/status + character
      add_newline = true;
      command_timeout = 200;
      format = "[$directory$git_branch$git_status]($style)$character";
      directory = {
        truncation_length = 2;
        truncation_symbol = "…/";
        repo_root_style = "bold cyan";
        repo_root_format = "[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) ";
      };
      git_branch = {
        format = "[$branch]($style) ";
        style = "italic cyan";
      };

      git_status = {
        format = "[$all_status]($style)";
        style = "cyan";
        ahead = "⇡\${count} ";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count} ";
        behind = "⇣\${count} ";
        conflicted = " ";
        up_to_date = " ";
        untracked = "? ";
        modified = " ";
        stashed = "";
        staged = "";
        renamed = "";
        deleted = "";
      };
    };
  };
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";
}
