{
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      
      cursorline = true;
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
  };
}
