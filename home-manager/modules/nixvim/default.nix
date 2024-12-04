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

    extraPlugins = with pkgs.vimPlugins; [
      monokai-pro-nvim
    ];

    extraConfigLua = ''
    	require("monokai-pro").setup({
        transparent_background = true;
      })

	vim.cmd([[colorscheme monokai-pro]])
    '';
  };
}
