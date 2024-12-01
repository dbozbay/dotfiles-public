{ pkgs, ... }: {

  imports = [
    ./options.nix
    # ./autocmds.nix
    ./keymaps.nix
    
    ./plugins/default.nix
  ];


  programs.nixvim = {
    enable = true;
    package = pkgs.neovim; # This is actually neovim-nightly!
    defaultEditor = true;
  };
}

	#    # Web-devicons
	#    plugins.web-devicons = {
	#      enable = true;
	#    };
	#
	#
	#
	#
	#        lua_ls.enable = true;
	# ruff.enable = true;
	# pyright.enable = true;
	#      };
	#    };
	#
	#    # Autocompletion
	#    plugins.cmp = {
	#      enable = true;
	#      autoEnableSources = true;
	#      settings = {
	#        sources = [
	#   {name = "nvim_lsp";}
	#   {name = "luasnip";}
	#   {name = "path";}
	#   {name = "buffer";}
	#        ];
	#      };
	#    };
	#
	#    # Conform (formatter)
	#    plugins.conform-nvim = {
	#      enable = true;
	#      settings = {
	#        formatters_by_ft = {
	#          cpp = [ "clang_format" ];
	#          python = [ 
	#            "ruff_format"
	#            "ruff_organize_imports"
	#          ];
	#          lua = [ "stylua" ];
	#          nix = [ 
	#            "nixfmt"
	#            "alejandra" 
	#          ];
	#        };
	#        default_format_opts = {
	#          lsp_format = "fallback";
	#        };
	#        format_on_save = {
	#          timeout = 500;
	#          lsp_fallback = "fallback";
	#        };
	#        notify_on_error = true;
	#      };
	#    };
	#    extraPlugins = with pkgs; [
	#      alejandra 
	#      stylua
	#      nixfmt-rfc-style
	#    ];
	#  };

