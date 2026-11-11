{
  programs.starship = {
    enable = true;
    settings = {
      format = "$os$hostname[](fg:bright-red bg:green)$directory[](fg:green bg:bright-yellow)$git_branch";

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

      git_branch = {
        format = " [$symbol$branch]($style)";
        style = "bg:bright-yellow fg:bright-white";
        truncation_symbol = "";
      };
    };
  };
}

#eft = '', right = '
