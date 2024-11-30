{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # vim.g
    globals = {
      leader = " ";
    };

    # vim.opt.
    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;

      wrap = true;

      ignorecase = true;
      smartcase = true;
      hlsearch = false;
      incsearch = true;

      termguicolors = true;

      scrolloff = 8;
      backspace = "indent,eol,start";

      splitright = true;
      splitbelow = true;

      swapfile = false;
      backup = false;
    };

    # keymaps
    keymaps = [
      {
        mode = "i";
        action = "<ESC>";
        key = "jk";
      }

      {
        action = "<C-[>";
        key = "<ESC>";
      }

      {
         mode = [ "n" "v" ];
         action = "gg<S-v>G";
         key = "<C-a>";
         options.desc = "Select all";
      }
    ];


    # colorscheme
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
        term_colors = true;
      };
    };
    
    # Web-devicons
    plugins.web-devicons = {
      enable = true;
    };

    # Lualina
    plugins.lualine = {
      enable = true;
    };

    # Telescope
    plugins.telescope = {
      enable = true;
    };

    # Treesitter (ALL parsers included!)
    plugins.treesitter = {
      enable = true;
    };

    # Lsp
    plugins.lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        lua_ls.enable = true;
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
