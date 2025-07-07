{ config, ... }:

{

boot.loader.grub.extraEntries = ''
    menuentry "Windows 11" {
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root 5356-F39B
        chainloader /efi/Microsoft/Boot/bootmgfw.efi
  }
  menuentry "Arch Linux (on /dev/nvme0n1p10)" {
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root 08CD-A51E
        linux /vmlinuz-linux root=/dev/nvme0n1p10
        initrd /initramfs-linux.img
  }
  menuentry "Pop!_OS 24.04 LTS (24.04) (on /dev/nvme0n1p11)" {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root 9c5610c7-b2e2-49cb-a43e-6fbc5b17af42
        linux /boot/vmlinuz-6.15.0-061500-generic root=UUID=9c5610c7-b2e2-49cb-a43e-6fbc5b17af42 ro quiet splash $vt_handoff
        initrd /boot/initrd.img-6.15.0-061500-generic
  }
  menuentry "Linux Mint 22.1 Xia (22.1) (on /dev/nvme0n1p7)" {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root 52b5953a-789d-4c4b-9d9a-771e4f90f083
        linux /boot/vmlinuz-6.15.0-061500-generic root=UUID=52b5953a-789d-4c4b-9d9a-771e4f90f083 ro quiet splash
        initrd /boot/initrd.img-6.15.0-061500-generic
  }
  menuentry "Ubuntu Questing Quokka (development branch) (25.10) (on /dev/nvme0n1p9)" {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root 6bb17358-5660-4521-93e2-8a34d48431a3
        linux /boot/vmlinuz-6.14.0-15-generic root=UUID=6bb17358-5660-4521-93e2-8a34d48431a3 ro quiet splash crashkernel=2G-4G:320M,4G-32G:512M,32G-64G:1024M,64G-128G:2048M,128G-:4096M $vt_handoff
        initrd /boot/initrd.img-6.14.0-15-generic
  }
  menuentry "Fedora Linux 43 (Sway Prerelease) (on /dev/nvme0n1p14)" {
        savedefault
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root 501cb284-35b9-4d96-974b-f4cf25c5f6c9
        linux /boot/vmlinuz-6.16.0-0.rc0.250605gec7714e494790.13.fc43.x86_64 root=/dev/nvme0n1p14
        initrd /boot/initramfs-6.16.0-0.rc0.250605gec7714e494790.13.fc43.x86_64.img
  }
  menuentry "Manjaro Linux" {
	savedefault
	load_video
	set gfxpayload=keep
	insmod gzio
	insmod part_gpt
	insmod ext2
	search --no-floppy --fs-uuid --set=root 2ad74e4f-fd16-467b-add1-40772ee0635b
	linux	/boot/vmlinuz-6.15-x86_64 root=UUID=2ad74e4f-fd16-467b-add1-40772ee0635b rw  quiet apparmor=1 security=apparmor udev.log_priority=3
	initrd	/boot/intel-ucode.img /boot/amd-ucode.img /boot/initramfs-6.15-x86_64.img
  }
  menuentry "KDE Neon" {
        img_path="/kde/KDE.img"
        img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
        search --no-floppy --set=root --file "/kde/KDE.img"
        loopback loop "/kde/KDE.img"
        linuxloops_args="rdinit=/linuxloops img_path=/kde/KDE.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
        export linuxloops_args
        configfile (loop,2)/grub/grub.cfg
  }
  menuentry "Void" {
        img_path="/void/void.img"
        img_uuid="382beb22-a137-49e8-b44a-ee62d376619d"
        search --no-floppy --set=root --file "/void/void.img"
        loopback loop "/void/void.img"
        linuxloops_args="rdinit=/linuxloops img_path=/void/void.img img_uuid=382beb22-a137-49e8-b44a-ee62d376619d"
        export linuxloops_args
        configfile (loop,2)/grub/grub.cfg
  }
  '';  

}
