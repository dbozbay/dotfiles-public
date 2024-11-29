{ pkgs, ... }: {

   programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      rose-pine
      telescope-nvim
    ];
    extraLuaConfig = 
      ''
        vim.g.mapleader = " "
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.termguicolors = true
      '';
  };
}
