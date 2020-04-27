# Kenrl Modify

## default kernel list
```bash
awk '/menuentry/ && /class/ {count++; print count-1"****"$0 }' /boot/grub/grub.cfg

0****menuentry 'Ubuntu' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-d506a87d-5f71-4f34-b0b4-c44fab563215' {
1****   menuentry 'Ubuntu, with Linux 4.4.0-177-generic' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-4.4.0-177-generic-advanced-d506a87d-5f71-4f34-b0b4-c44fab563215' {
2****   menuentry 'Ubuntu, with Linux 4.4.0-177-generic (upstart)' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-4.4.0-177-generic-init-upstart-d506a87d-5f71-4f34-b0b4-c44fab563215' {
3****   menuentry 'Ubuntu, with Linux 4.4.0-177-generic (recovery mode)' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-4.4.0-177-generic-recovery-d506a87d-5f71-4f34-b0b4-c44fab563215' {
4****   menuentry 'Ubuntu, with Linux 4.4.0-31-generic' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-4.4.0-31-generic-advanced-d506a87d-5f71-4f34-b0b4-c44fab563215' {
5****   menuentry 'Ubuntu, with Linux 4.4.0-31-generic (upstart)' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-4.4.0-31-generic-init-upstart-d506a87d-5f71-4f34-b0b4-c44fab563215' {
6****   menuentry 'Ubuntu, with Linux 4.4.0-31-generic (recovery mode)' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-4.4.0-31-generic-recovery-d506a87d-5f71-4f34-b0b4-c44fab563215' {
```

## list number 4  modify
```bash
sed -i  's/GRUB_DEFAULT=0/GRUB_DEFAULT=4/g' /etc/default/grub; update-grub

Generating grub configuration file ...
Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported.
Found linux image: /boot/vmlinuz-4.4.0-177-generic
Found initrd image: /boot/initrd.img-4.4.0-177-generic
Found linux image: /boot/vmlinuz-4.4.0-31-generic
Found initrd image: /boot/initrd.img-4.4.0-31-generic
done
```
