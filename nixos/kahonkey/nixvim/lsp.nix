{
  lsp = {
    servers = {
      nixd = {
        enable = true;

        config = {
          cmd = [ "nixd" ];
          filetypes = [ "nix" ];
          root_markers = [
            "configuration.nix"
            "flake.nix"
            ".git"
          ];
        };
      };

      jdtls = {
        enable = true;

        config = {
          cmd = [ "jdtls" ];
          filetypes = [ "java" ];
          root_markers = [
            "gradle/"
            "gradlew"
            ".git"
          ];
        };
      };
    };
  };
}
