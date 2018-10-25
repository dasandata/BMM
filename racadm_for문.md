# racadm 반복작업 예제


```bash

cat << EOF > racadm-aaaa.sh
#!/bin/bash
RACADMCMD=" set System.ServerPwr.PSRedPolicy 0 "

echo "Master"
racadm -r Master.idrac -u root -p calvin    \$RACADMCMD
echo

for  i  in  01 02 03 04 05 06 07 08 09 10
do
echo "Node\$i"
racadm -r Node\$i.idrac -u root -p calvin   \$RACADMCMD
echo
done

EOF
bash racadm-aaaa.sh
```
