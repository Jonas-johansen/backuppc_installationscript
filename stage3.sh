
echo "JOHANSEN DATA - BACKUP PC SCRIPT STAGE 3"
sleep 1
echo "1"
sleep 1
echo "2"
sleep 1
echo "3"
sleep 1
echo "4"
sleep 1
echo "5"
sleep 1
echo "Hva er ip addressen til klienten din?"
read klientip
sleep 1
echo "Hvilken mappe ønsker du backup av?"
read backupmappe
sleep 1
ssh-keygen
sleep 2
ssh-copy-id root@$klientip
echo "$klientip   0   backuppc" >> /etc/backuppc/hosts
echo "\$Conf{backupPCNightlyPeriod} = 1;" >> /etc/backuppc/$klientip.pl
echo "\$Conf{RsyncShareName} = [
    '$backupmappe'\
];" >> /etc/backuppc/$klientip.pl
echo "\$Conf{XferMethod} = 'rsync';" >> /etc/backuppc/$klientip.pl
systemctl restart apache2
systemctl restart backuppc
echo "Klient skal nå være lagt til!"
