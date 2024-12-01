{
  programs.nixvim = {
    plugins = {
      cmp-nvim-lsp = {
        enable = true;
      };

      cmp_luasnip = {
        enable = true;
      };

      cmp-path = {
        enable = true;
      };

      cmp-buffer = {
        enable = true;
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {name = "path";}
            {name = "buffer";}
          ];
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-u>" = "cmp.mapping.scroll_docs(-4)";
            "<C-d>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
          snippet = {
            expand = "luasnip";
          };
        };
      };

      lspkind = {
        enable = true;
        mode = "symbol";
        cmp = {
          enable = true;
        };
      };
    };
  };
}
