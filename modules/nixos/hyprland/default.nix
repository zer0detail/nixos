{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true; ## X apps support
  };

  environment.sessionVariables = {
    ## Helps with invisible cursor issue
    WLR_NO_HARDWARE_CURSORS = "1";
    ## Tell electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
}
