{
  programs.starship = {
    enable = true;
    settings = {
      format = "$os$hostname[](fg:bright-red bg:green)$directory[](fg:green bg:bright-yellow)$git_branch$fill$git_commit";

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
        format = "[$path]($style)";
        style = "bg:green fg:bright-red";
        truncation_length = 2;
        truncation_symbol = "";
      };

      fill = {
        symbol = " ";
      };

      git_branch = {
        format = "[ $symbol$branch]($style)";
        style = "bg:bright-yellow fg:bright-white";
        truncation_symbol = "";
      };

      git_commit = {
        format = "[$hash$tag]($style)";
        style = "bg:bright-yellow fg:bright-white";
        tag_disabled = false;
        tag_symbol = "  ";
      };
    };
  };
}

#eft = '', right = '
