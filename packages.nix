#packages, special packages and special services are in specialps.nix

{ pkgs, ... }:
# List packages installed in system profile. To search, run:
  # $ nix search wget

{  environment.systemPackages = with pkgs; [ 
  
  
   pkgs.mpg123  
   pkgs.acpi 
   pkgs.protontricks 
   pkgs.gh 
   pkgs.microsoft-edge 
   pkgs.librewolf 
   pkgs.hyprland-autoname-workspaces 
   pkgs.rofi-wayland 
   pkgs.swayest-workstyle 
   pkgs.libreoffice-qt6-fresh 
   pkgs.fzf 
   pkgs.eza 
   pkgs.foot 
   pkgs.waybar
   pkgs.wmenu 
   pkgs.python314 
   pkgs.efibootmgr 
   pkgs.lm_sensors 
   pkgs.libnotify 
   pkgs.swaynotificationcenter 
   pkgs.btop 
   pkgs.hyprlock 
   pkgs.hyprpaper 
   pkgs.clipman 
   pkgs.blesh 
   pkgs.atuin 
   pkgs.nix-index 
   pkgs.kdePackages.okular 
   pkgs.kdePackages.qtmultimedia 
   pkgs.swww 
   pkgs.waypaper 
   pkgs.brightnessctl 
   pkgs.hyprpolkitagent 
   pkgs.fastfetch 
   pkgs.kitty 
   pkgs.wofi 
   pkgs.keyd 
   pkgs.git 
   pkgs.wget 
   pkgs.gparted 
   pkgs.chiaki-ng 
   pkgs.google-chrome
   pkgs.nwg-bar
   pkgs.wev

  ];

  
   fonts.packages = with pkgs; [ 
  
  
   pkgs.nerd-fonts.sauce-code-pro 
   pkgs.nerd-fonts._3270 
   pkgs.nerd-fonts._0xproto 
   pkgs.nerd-fonts.jetbrains-mono 
   pkgs.nerd-fonts.meslo-lg 
   pkgs.nerd-fonts.noto 
   pkgs.nerd-fonts.hack 
   pkgs.font-awesome 
   ];

  
}

