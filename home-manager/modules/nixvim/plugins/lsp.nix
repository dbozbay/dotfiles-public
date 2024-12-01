{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
          };
          lua_ls = {
            enable = true;
          };
          ruff = {
            enable = true;
          };
          pyright = {
            enable = true;
          };
        };
      
        keymaps = {
          diagnostic = {
            "]d" = "goto_next";
            "[d" = "goto_prev";
          };
          lspBuf = {
            K = "hover";
            gr = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
            gD = "declaration";
            "<leader>cr" = { action = "rename"; desc = "Rename"; };
            "<leader>ca" = { action = "code_action"; desc = "Show Code Actions"; };
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = [ "alejandra" ];
            python = [ 
              "ruff_organize_imports"
              "ruff_format"
            ];
            lua = [ "stylua" ];
            cpp = [ "clang_format" ];
            rust = [ "rustfmt" ];
          };
          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 500;
          };
        };
      };
    };
  };
}
