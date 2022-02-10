#########################################
#   /$$$$$           /$$                                                               /$$$$$$$              /$$              
#   |__  $$          | $$                                                              | $$__  $$            | $$              
#      | $$  /$$$$$$ | $$$$$$$   /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$  /$$$$$$$       | $$  \ $$  /$$$$$$  /$$$$$$    /$$$$$$ 
#      | $$ /$$__  $$| $$__  $$ |____  $$| $$__  $$ /$$_____/ /$$__  $$| $$__  $$      | $$  | $$ |____  $$|_  $$_/   |____  $$
# /$$  | $$| $$  \ $$| $$  \ $$  /$$$$$$$| $$  \ $$|  $$$$$$ | $$$$$$$$| $$  \ $$      | $$  | $$  /$$$$$$$  | $$      /$$$$$$$
#| $$  | $$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$ \____  $$| $$_____/| $$  | $$      | $$  | $$ /$$__  $$  | $$ /$$ /$$__  $$
#|  $$$$$$/|  $$$$$$/| $$  | $$|  $$$$$$$| $$  | $$ /$$$$$$$/|  $$$$$$$| $$  | $$      | $$$$$$$/|  $$$$$$$  |  $$$$/|  $$$$$$$
# \______/  \______/ |__/  |__/ \_______/|__/  |__/|_______/  \_______/|__/  |__/      |_______/  \_______/   \___/   \_______/
# Johansen Data @2022 - Et produkt av Jonas Johansen
#alle rettigheter reservet JOHANSEN DATA. ALL BRUK AV SCRIPTET MÅ KLARERES MED JONAS JOHANSEN FØR BRUK!
# Skrevet av Jonas Johansen 8 februar 2022
#   STAGE 2
# Versjon : 1.0 |  BACKUP PC CLIENTS
echo "JOHANSEN DATA - BACKUP PC SCRIPT STAGE 2"
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
