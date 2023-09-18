{ config, pkgs, ... }:

{
  imports = [
   ./kitty
   ./zsh
  ];
  home.username = "zero";
  home.homeDirectory = "/home/zero";

  home.file = {
    ".p10k.zsh".source = ./zsh/.p10k.zsh; 
  };

  fonts.fontconfig.enable = true;
  # Basic git config
  programs.git = {
    enable = true;
    userName = "zerodetail";
    userEmail = "zerodetail@gmail.com";
  };
 programs.neovim = {
    enable = true;

    viAlias = true;
     vimAlias = true;
     vimdiffAlias = true;
  }; 
  xdg.configFile.nvim.source = ./nvim;

  # packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch  
    zoxide
    fzf
    (nerdfonts.override { fonts = [ "FiraCode"]; })
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
