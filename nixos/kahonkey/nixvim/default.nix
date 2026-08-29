{ inputs, ... }:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;

    imports = [
      ./auto-cmd.nix
      ./options.nix
      ./conform-nvim.nix
      ./lualine.nix
      ./lsp.nix
      ./colorschemes.nix
      ./cmp.nix
      ./treesitter.nix
      ./diagnostic.nix
      ./blankline.nix
      ./surround.nix
      ./toggleterm.nix
      ./nvim-tree.nix
    ];

    globals.mapleader = " ";
    keymaps = [
      # NvimTree
      {
        key = "<C-n>";
        action = "<CMD>NvimTreeToggle<CR>";
        options.desc = "Toggle NvimTree";
      }
      {
        key = "<C-f>";
        action = "<CMD>NvimTreeFocus<CR>";
        options.desc = "Focus NvimTree";
      }

      # Tabs
      {
        mode = "n";
        key = "<leader>td";
        action = "<CMD>tabclose<CR>";
        options.desc = "Close tab";
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<CMD>tabnext<CR>";
        options.desc = "Go to the sub-sequent tab";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<CMD>tabprevious<CR>";
        options.desc = "Go to the previous tab";
      }

      # Terminal
      {
        # Escape terminal mode using ESC
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        options.desc = "Escape terminal mode";
      }

      {
        mode = "v";
        key = "<S-k>";
        action = ":m '<-2<CR>gv=gv";
      }
      {
        mode = "v";
        key = "<S-j>";
        action = ":m '>+1<CR>gv=gv";
      }
    ];
  };
}
