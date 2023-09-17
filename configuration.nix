# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, helix, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 10;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than-1w";
  };

  nix.settings.auto-optimize-store = true;

  networking.hostName = "zerix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "au";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zero = {
    isNormalUser = true;
    description = "zero";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "zero";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6icGonUAx4T3BFqYdmv9ZQkkD+h/aD06H8AmqqW3dGNFMXd7pvB5wanUnHVfRyyLN6JV9ayhijVl5eH0gfWjYuNdC7yh7v8fTxjsWVmhxG1HY7TSaUxZ5o8UEMeSLWF0bBiuDAfw0eD8rUqDgt06VJCwzkjKfWUNf6PX0aNNi1dK9LJU/K0Om6Kvj29NGcoqagAgNrbPL6FjX+5HHRXPg1qfvXNy713nzwuqFqf7XElcYlmK/BwD2tjdl2XeVAUjhVvs8/ioVTjSJ02Vk7loYQwKzWm2oYrLtlfzNpGSUkIQl7pcp0ETtryoOzLlZ2pqnfoxO5YfwdgdSIAVSEb3vJGBd7jNZ/7QadOyt/5C0bVqBBgKUy32wPs5JLEvY7FCba/M7nb2XvB6APusqcJkq6lcGYgIaE/NogntWp89a0GTGsuUVNCKwmirQaUvQV6Fcy3Ceb4KdB1419dY7NCpANYThXHd57oWZQK7ACOGS0Ph081DeVVCSpntp4fohmB0= zero"
    ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };
  nix.settings.trusted-users = [ "zero" ];

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "zero";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    helix.packages."${pkgs.system}".helix 
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
