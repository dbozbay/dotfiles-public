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
         # "<leader>cr" = { action = "rename"; desc = "Rename"; };
         # "<leader>ca" = { action = "code_action"; desc = "Show Code Actions"; };
        };
      };
    };
  };
 };
}
