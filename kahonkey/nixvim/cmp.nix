# # Source: https://github.com/hmajid2301/dotfiles/blob/ab7098387426f73c461950c7c0a4f8fb4c843a2c/home-manager/editors/nvim/plugins/coding/cmp.nix
{
  plugins = {
    luasnip.enable = true;

    cmp-nvim-lsp = {
      enable = true;
    };

    cmp-path = {
      enable = true;
    };

    cmp_luasnip = {
      enable = true;
    };

    cmp = {
      enable = true;

      settings = {
        experimental = {
          ghost_text = true;
        };
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "nvim_lua"; }
          { name = "path"; }
        ];

        window = {
          completion = {
            winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
            scrollbar = false;
            sidePadding = 0;
            border = [
              "┌"
              "─"
              "┐"
              "│"
              "┘"
              "─"
              "└"
              "│"
            ];
          };

          settings.documentation = {
            border = [
              "┌"
              "─"
              "┐"
              "│"
              "┘"
              "─"
              "└"
              "│"
            ];
            winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
          };
        };

        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<S-Tab>" = "cmp.mapping.close()";
          "<Tab>" =
            # lua
            ''
              function(fallback)
                local line = vim.api.nvim_get_current_line()
                if line:match("^%s*$") then
                  fallback()
                elseif cmp.visible() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                else
                  fallback()
                end
              end
            '';
          "<Down>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
          "<Up>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
        };
      };
    };
  };
}
