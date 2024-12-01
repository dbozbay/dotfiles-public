{ pkgs, ... }: {

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim; # This is actually neovim-nightly!
    defaultEditor = true;

    # vim.g
    globals = {
      mapleader = " ";
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
      keymaps = {
        ";f" = {
          action = "find_files";
          options = {
            desc = "Telescope Find Files";
          };
        };
        ";g" = {
          action = "git_files";
          options = {
            desc = "Telescope Git Files";
          };
        };
        ";s" = "live_grep";
      };
    };

    # Treesitter (ALL parsers included!)
    plugins.treesitter = {
      enable = true;
      settings = {
        ensure_installed = [
          "nix"
          "python"
          "cpp"
          "lua"
          "toml"
          "json"
          "markdown"
          "markdown_inline"
        ];
      };
    };

    # Lsp
    plugins.lsp = {
      enable = true;
      servers = {
        
        nixd = {
          enable = true;
          settings = {
            formatting.command = [ "alejandra" ];
          };
        };


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

    # Conform (formatter)
    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          cpp = [ "clang_format" ];
          python = [ 
            "ruff_format"
            "ruff_organize_imports"
          ];
          lua = [ "stylua" ];
          nix = [ 
            "nixfmt"
            "alejandra" 
          ];
        };
        default_format_opts = {
          lsp_format = "fallback";
        };
        format_on_save = {
          timeout = 500;
          lsp_fallback = "fallback";
        };
        notify_on_error = true;
      };
    };
    extraPlugins = with pkgs; [
      alejandra 
      stylua
      nixfmt-rfc-style
    ];
  };
}
