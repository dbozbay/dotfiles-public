{
  programs.nixvim = {
    keymaps = [
      {
        mode = "i";
        action = "<ESC>";
        key = "jk";
        options = {
          desc = "Escape in insert mode";
        };
      }

      {
        mode = [ "n" "v" ];
        action = "gg<S-v>G";
        key = "<C-a>";
        options = {
          desc = "Select all";
        };
      }
    ];
  };
}
