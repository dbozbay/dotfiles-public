{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # colorscheme
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
        term_colors = true;
      };
    };

    # Lualina
    plugins.lualine = {
      enable = true;
    };

    # Lsp
    plugins.lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        lua-ls.enable = true;
	ruff.enable = true;
	pyright.enable = true;
      };
    };

    # Autocompletion
    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
	  {name = "nvim_lsp";}
	  {name = "luasnip";}
	  {name = "path";}
	  {name = "buffer";}
        ];
      };
    };
  };
}
