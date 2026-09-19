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

      qmlls = {
        enable = true;

        config = {
          cmd = [ "qmlls" ];
          filetypes = [
            "qml"
            "qmljs"
          ];
          root_markers = [ "shell.qml" ];
        };
      };

      kotlin-lsp = {
        enable = true;
        config = {
          cmd = [ "kotlin" ];
          filetypes = [
            "kt"
            "kts"
          ];
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
