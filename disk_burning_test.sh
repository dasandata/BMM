for I in $(seq 1 100)

do echo "$I st..."
sync && echo 3 >  /proc/sys/vm/drop_caches
dd if=/dev/zero of=test.file bs=10M count=1000
md5sum test.file
rm -f test.file

done
