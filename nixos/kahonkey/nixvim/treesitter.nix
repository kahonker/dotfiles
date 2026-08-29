{
  plugins.treesitter = {
    enable = true;
    settings = {
      folding = {
        enable = true;
        disable = [ "nix" ];
      };
    };
  };
}
