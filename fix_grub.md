
I have installed win10 and deepin(Debian/Ubuntu).

And after updating win10, the GNU GRUB is not exist after computer booting and bios booting. It just enter the win10.

I've tried easybcd to create grub and even the grub command `root` and `chainloader`, however thoese tools can not fix/recover the grub

finally. I fix the grub as below (i'm not sure any unnecessary command is included)

0. use `try ubuntu` with usb disk
1. open terminal and access into root (`sudo -s`)
2. mount my linux boot partition(?) to a new created folder(`mount /dev/sda1 /mnt`)
3. install grub `grub-install --root-directory=/mnt /dev/sda`
4. reboot
5. after entering linux, use `sudo update-grub` to fresh the GRUB menu

in the `2.` step, you can use `fdisk -l` before to check which path is point to you linux boot partition

int the `3.` step, you should be careful about `/dev/sda` instead of `/dev/sda1`, wrong instruction **WILL NOT** cause disaster and will report error

