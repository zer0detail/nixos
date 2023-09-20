{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # xdg.configFile.nvim.source = ../nvim;
    #extraLuaConfig = ''
    #  ${builtins.readFile ./lua/zero/options.lua}
    #'';
  };
}
