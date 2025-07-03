#special packages and services

{ pkgs, ... }:
# packages needing special arguments and services
{  environment.systemPackages = with pkgs; [ 
   pkgs.swayosd

   

    #special packages 
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


#services
#swayosd backend service
 services.udev.packages = [ pkgs.swayosd ];

    systemd.services.swayosd-libinput-backend = {
      description = "SwayOSD LibInput backend for listening to certain keys like CapsLock, ScrollLock, VolumeUp,etc.";
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
  
}
