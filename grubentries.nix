{ config, ... }:

{

boot.loader.grub.extraEntries = ''
    menuentry "Windows 11" {
        savedefault
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root 5356-F39B
        chainloader /efi/Microsoft/Boot/bootmgfw.efi
  }
  menuentry 'CachyOS Linux' --class cachyos --class gnu-linux --class gnu --class os {
	savedefault
	set gfxpayload=keep
	insmod gzio
	insmod part_gpt
	insmod btrfs
	search --no-floppy --fs-uuid --set=root 1b83b2e3-d653-42e1-924b-81c337c05339
	linux	/@/boot/vmlinuz-linux-cachyos root=UUID=1b83b2e3-d653-42e1-924b-81c337c05339 rw rootflags=subvol=@  nowatchdog nvme_load=YES zswap.enabled=0 splash loglevel=3
	initrd	/@/boot/initramfs-linux-cachyos.img
 }
  menuentry "Pop!_OS 24.04 LTS (24.04) (on /dev/nvme0n1p11)" {
        savedefault
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root 9c5610c7-b2e2-49cb-a43e-6fbc5b17af42
        linux /boot/vmlinuz-6.15.0-061500-generic root=UUID=9c5610c7-b2e2-49cb-a43e-6fbc5b17af42 ro quiet splash $vt_handoff
        initrd /boot/initrd.img-6.15.0-061500-generic
  }
  menuentry "Linux Mint 22.1 Xia (22.1) (on /dev/nvme0n1p7)" {
        savedefault
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root 52b5953a-789d-4c4b-9d9a-771e4f90f083
        linux /boot/vmlinuz-6.15.0-061500-generic root=UUID=52b5953a-789d-4c4b-9d9a-771e4f90f083 ro quiet splash
        initrd /boot/initrd.img-6.15.0-061500-generic
  }
  menuentry "Fedora Linux 43 (Sway Prerelease) (on /dev/nvme0n1p14)" {
        savedefault
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root 501cb284-35b9-4d96-974b-f4cf25c5f6c9
        linux /boot/vmlinuz-6.16.0-0.rc0.250605gec7714e494790.13.fc43.x86_64 root=/dev/nvme0n1p14
        initrd /boot/initramfs-6.16.0-0.rc0.250605gec7714e494790.13.fc43.x86_64.img
  }
  menuentry 'Manjaro Linux (25.0.5) (on /dev/nvme0n1p15)' --class manjarolinux --class gnu-linux --class gnu --class os {
	savedefault
        insmod part_gpt
	insmod ext2
	search --no-floppy --fs-uuid --set=root 6a79d224-aa21-4011-bf80-732cebde2430
	linux /boot/vmlinuz-6.15-x86_64 root=UUID=6a79d224-aa21-4011-bf80-732cebde2430 rw quiet apparmor=1 security=apparmor udev.log_priority=3
	initrd /boot/intel-ucode.img /boot/amd-ucode.img /boot/initramfs-6.15-x86_64.img
  }
  menuentry 'Debian' --class 'debian' {
	img_path="/debianC/Debian.img"
	img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
	search --no-floppy --set=root --file "/debianC/Debian.img"
	loopback loop "/debianC/Debian.img"
	linuxloops_args="rdinit=/linuxloops img_path=/debianC/Debian.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
	export linuxloops_args
	configfile (loop,2)/grub/grub.cfg
  }
  menuentry "KDE Neon" {
        savedefault
        img_path="/kde/KDE.img"
        img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
        search --no-floppy --set=root --file "/kde/KDE.img"
        loopback loop "/kde/KDE.img"
        linuxloops_args="rdinit=/linuxloops img_path=/kde/KDE.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
        export linuxloops_args
        configfile (loop,2)/grub/grub.cfg
  }
  menuentry "Void" {
        savedefault
        img_path="/void/void.img"
        img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
        search --no-floppy --set=root --file "/void/void.img"
        loopback loop "/void/void.img"
        linuxloops_args="rdinit=/linuxloops img_path=/void/void.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
        export linuxloops_args
        configfile (loop,2)/grub/grub.cfg
  }
  menuentry 'Bazzite' --class 'bazzite' {
	savedefault
        img_path="/bazzite/Bazzite.img"
	img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
	search --no-floppy --set=root --file "/bazzite/Bazzite.img"
	loopback loop "/bazzite/Bazzite.img"
	linuxloops_args="rdinit=/linuxloops img_path=/bazzite/Bazzite.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
	export linuxloops_args
	configfile (loop,2)/grub2/grub.cfg
  }
  menuentry 'Nobara' --class 'nobara' {
	savedefault
        img_path="/nobara/Nobara.img"
	img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
	search --no-floppy --set=root --file "/nobara/Nobara.img"
	loopback loop "/nobara/Nobara.img"
	linuxloops_args="rdinit=/linuxloops img_path=/nobara/Nobara.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
	export linuxloops_args
	configfile (loop,2)/grub2/grub.cfg
  }
  menuentry 'PikaOS' --class 'pikaos' {
	savedefault
        img_path="/pikaos/PikaOS.img"
	img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
	search --no-floppy --set=root --file "/pikaos/PikaOS.img"
	loopback loop "/pikaos/PikaOS.img"
	linuxloops_args="rdinit=/linuxloops img_path=/pikaos/PikaOS.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
	export linuxloops_args
	configfile (loop,2)/grub/grub.cfg
  }
  menuentry 'SteamOS' --class 'steamos' {
	savedefault
        img_path="/steamos3.7G/SteamOS.img"
	img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
	search --no-floppy --set=root --file "/steamos3.7G/SteamOS.img"
	loopback loop "/steamos3.7G/SteamOS.img"
	linuxloops_args="rdinit=/linuxloops img_path=/steamos3.7G/SteamOS.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
	export linuxloops_args
	configfile (loop,2)/grub/grub.cfg
  }
  menuentry 'CachyOS gnome' --class 'cachyos' {
	savedefault
        img_path="/cachyos/CachyOS.img"
	img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
	search --no-floppy --set=root --file "/cachyos/CachyOS.img"
	loopback loop "/cachyos/CachyOS.img"
	linuxloops_args="rdinit=/linuxloops img_path=/cachyos/CachyOS.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
	export linuxloops_args
	configfile (loop,2)/grub/grub.cfg
  }
  menuentry 'Arch-Gnome' --class 'arch' {
	savedefault
        img_path="/arch-gnome/ArchG.img"
	img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
	search --no-floppy --set=root --file "/arch-gnome/ArchG.img"
	loopback loop "/arch-gnome/ArchG.img"
	linuxloops_args="rdinit=/linuxloops img_path=/arch-gnome/ArchG.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
	export linuxloops_args
	configfile (loop,2)/grub/grub.cfg
  }
  menuentry 'OpenSUSE' --class 'opensuse' {
	img_path="/opensusek/OpenSUSEk.img"
	img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
	search --no-floppy --set=root --file "/opensusek/OpenSUSEk.img"
	loopback loop "/opensusek/OpenSUSEk.img"
	linuxloops_args="rdinit=/linuxloops img_path=/opensusek/OpenSUSEk.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
	export linuxloops_args
	configfile (loop,2)/grub2/grub.cfg
  }


  '';  

}
