{ config, pkgs, ... }:

{
  home.username = "zero";
  home.homeDirectory = "/home/zero";

  # Basic git config
  programs.git = {
    enable = true;
    userName = "zerodetail";
    userEmail = "zerodetail@gmail.com";
  };

  # packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch  
  ];

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
