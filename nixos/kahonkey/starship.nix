{
  programs.starship = {
    enable = true;
    settings = {
      format = "[╭──╴](fg:green)[◖](fg:bright-red)$os$hostname[](fg:bright-red bg:green)$directory[](fg:green bg:bright-blue)$character[](fg:bright-blue bg:bright-yellow)$git_branch[](fg:bright-yellow bg:bright-green)$git_metrics[◗](fg:bright-green)$fill$git_commit$line_break[╰─🯟](fg:green) ";

      os = {
        format = "[$symbol]($style)";
        style = "bold bg:bright-red fg:bright-white";
        disabled = false;
      };
      os.symbols.NixOS = " ";

      hostname = {
        format = "[$hostname%]($style)";
        style = "bold bg:bright-red fg:bright-white";
        ssh_only = false;
      };

      directory = {
        format = "[ $path ]($style)";
        style = "bg:green fg:black";
        truncation_length = 2;
        truncation_symbol = "";
      };

      fill = {
        symbol = " ";
      };

      character = {
        format = "[ $symbol ](bg:bright-blue fg:black)";
        success_symbol = "INSERT";
        error_symbol = "INSERT";
        vimcmd_symbol = "NORMAL";
        vimcmd_visual_symbol = "VISUAL";
      };

      git_branch = {
        format = "[ $symbol$branch ]($style)";
        style = "bg:bright-yellow fg:bright-white";
        truncation_symbol = "";
      };

      git_metrics = {
        format = "[ +$added]($added_style)[ -$deleted]($deleted_style)";
        added_style = "bg:bright-green fg:bright-white";
        deleted_style = "bg:bright-green fg:green";
        disabled = false;
        only_nonzero_diffs = false;
      };

      git_commit = {
        format = "[◖](fg:bright-green)[$hash$tag ]($style)";
        style = "bg:bright-green fg:bright-white";
        tag_disabled = false;
        tag_symbol = "  ";
      };
    };
  };
}

#eft = '', right = '
