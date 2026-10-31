{ kotlin-lsp, ... }: {
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
          ];
          root_markers = [ "shell.qml" ];
        };
      };

      pyright = {
        enable = true;

        config = {
          cmd = [ "pyright" ];
          filetypes = [ "python" ];
          root_markers = [
            ".git"
            "requirements.txt"
          ];
        };
      };

      kotlin-lsp = {
        enable = true;

        package = kotlin-lsp;

        config = {
          cmd = [
            "kotlin-lsp"
            "--stdio"
          ];
          filetypes = [
            "kotlin"
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
