
echo "BACKUP PC SCRIPT STAGE 2"
echo "Dette skriptet skal kun brukes på klienten! Skriptet starter om"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
sleep 1
service sshd restart
sleep 1
ip4=$(/sbin/ip -o -4 addr list ens18 | awk '{print $4}' | cut -d/ -f1)
echo "Klienten er nå klargjort."
sleep 1
echo Ip addressen er: $ip4
