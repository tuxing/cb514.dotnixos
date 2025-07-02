# Edit this configuration file to define what should be installed on your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./swayosd.nix
      # ./sddm-astronaut.nix
    ];

  # Bootloader.
  #  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = false;
  boot.loader.grub.efiSupport = true; 

  #bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.package = pkgs.kdePackages.sddm;
  services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "hyprland";
  services.displayManager.sddm.theme = "sddm-astronaut-theme";
  services.desktopManager.plasma6.enable = true;


  # xdg.portal.wlr.enable = true;
  xdg.menus.enable = true;
  xdg.mime.enable = true;

  #enable hyprland 
  programs.hyprland.enable = true;  
 
  #enable sway
  programs.sway.enable = true;  

  #steam
  programs.steam.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb = {
  #  layout = "us";
  #  variant = "";
  #};

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zen = {
    isNormalUser = true;
    description = "zen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = false;
  #services.displayManager.autoLogin.user = "zen";
  
  # services.passSecretService.enable = true;
  # Install firefox.
  programs.firefox.enable = true;
  # enable dynamically linked execs
  programs.nix-ld.enable = true;  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ pkgs.swayosd pkgs.acpi pkgs.protontricks pkgs.gh pkgs.microsoft-edge pkgs.librewolf pkgs.hyprland-autoname-workspaces pkgs.rofi-wayland pkgs.swayest-workstyle pkgs.libreoffice-qt6-fresh pkgs.fzf pkgs.zoxide pkgs.eza pkgs.foot pkgs.waybar pkgs.i3status pkgs.wmenu pkgs.python314 pkgs.avizo pkgs.efibootmgr pkgs.lm_sensors pkgs.libnotify pkgs.ghostty pkgs.swaynotificationcenter pkgs.os-prober pkgs.btop pkgs.hyprlock pkgs.hypridle pkgs.hyprpaper pkgs.clipman pkgs.blesh pkgs.atuin pkgs.nix-index pkgs.kdePackages.okular pkgs.kdePackages.qtmultimedia pkgs.where-is-my-sddm-theme pkgs.swww pkgs.waypaper pkgs.brightnessctl pkgs.hyprpolkitagent pkgs.fastfetch pkgs.kitty pkgs.wofi pkgs.keyd pkgs.git pkgs.wget pkgs.gparted pkgs.ntfs3g pkgs.chiaki-ng pkgs.google-chrome
   (pkgs.callPackage ./sddm-astronaut-theme.nix {
        theme = "jake_the_dog";
        themeConfig={
            General = {
            HeaderText ="Welcome Zen";
            #Background="/home/user/Desktop/wp.png";
            #FontSize="10.0";
                };      
            };
      })
  ];
  fonts.packages = with pkgs; [ pkgs.nerd-fonts.jetbrains-mono pkgs.nerd-fonts.meslo-lg pkgs.nerd-fonts.noto pkgs.nerd-fonts.hack pkgs.font-awesome ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.keyd.enable = true;
  services.power-profiles-daemon.enable = true;
  # services.swayosd.enable = true;
  # services.auto-cpufreq.enable = true;  
  
  # services.logind.lidSwitch = "ignore";  
  #swayosd backend service
  services.udev.packages = [ pkgs.swayosd ];

    systemd.services.swayosd-libinput-backend = {
      description = "SwayOSD LibInput backend for listening to certain keys like CapsLock, ScrollLock, VolumeUp, etc.";
      documentation = [ "https://github.com/ErikReider/SwayOSD" ];
      wantedBy = [ "graphical.target" ];
      partOf = [ "graphical.target" ];
      after = [ "graphical.target" ];

      serviceConfig = {
        Type = "dbus";
        BusName = "org.erikreider.swayosd";
        ExecStart = "${pkgs.swayosd}/bin/swayosd-libinput-backend";
        Restart = "on-failure";
      };
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
  system.stateVersion = "25.05"; # Did you read the comment?
 
  #intel hardware accleration 
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # For older processors. LIBVA_DRIVER_NAME=i965
    ];
  };
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Optionally, set the environment variable
}
