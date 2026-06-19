{ ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      number = true;
      relativenumber = true;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      mouse = "a";
      autochdir = true;
    };

    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = ";";
        action = ":";
      }
      {
        mode = "v";
        key = ";";
        action = ":";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":NvimTreeToggle<CR>";
      }
      {
        mode = "n";
        key = "<leader><S-e>";
        action = ":NvimTreeFocus<CR>";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = ":Telescope find_files<CR>";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = ":Telescope live_grep<CR>";
      }
      {
        mode = "n";
        key = "<leader><Tab>";
        action = ":bnext<CR>";
      }
      {
        mode = "n";
        key = "<leader><S-Tab>";
        action = ":bprev<CR>";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = ":bd<CR>";
      }
    ];

    colorschemes.catppuccin.enable = true;

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      nvim-tree.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      nvim-autopairs.enable = true;
      web-devicons.enable = true;

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          clangd.enable = true;
          zls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          pyright.enable = true;
        };
      };

      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "path"; }
            { name = "luasnip"; }
          ];
        };
      };
      luasnip.enable = true;
    };
  };
}
