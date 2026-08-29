{ lib, pkgs, ... }:

{
  plugins.conform-nvim = {
    enable = true;

    settings = {
      formatters_by_ft = {
        nix = [
          "nixfmt"
        ];
        kdl = [
          "kdlfmt"
        ];
      };
      format_on_save = # Lua
        ''
          (function()
            if _G.slow_format_filetypes == nil then
              _G.slow_format_filetypes = {}
            end

            return function(bufnr)
              if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
              end

              if _G.slow_format_filetypes[vim.bo[bufnr].filetype] then
                return
              end

              local function on_format(err)
                if err and err:match("timeout$") then
                  _G.slow_format_filetypes[vim.bo[bufnr].filetype] = true
                end
              end

              return { timeout_ms = 200, lsp_fallback = true }, on_format
            end
          end)()
        '';
      formatters = {
        nixfmt = {
          command = lib.getExe pkgs.nixfmt;
        };
        kdlfmt = {
          command = lib.getExe pkgs.kdlfmt;
        };
      };
    };
  };
}
