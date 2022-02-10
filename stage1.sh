######################################
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
#    STAGE 1
# Versjon : 1.0 | BACKUP PC - SERVER MAIN
echo "JOHANSEN DATA - BACKUP PC SCRIPT STAGE 1"
sleep 2
apt-get install apache2-utils
apt-get install backuppc -y
echo "Hvilket passord ønsker du for backup up pc? Dette skriver du igjen når du blir bedt om å opprette et passord."
sleep 3
read passord   
sudo
htpasswd /etc/backuppc/htpasswd backuppc
systemctl start backuppc
systemctl enable backuppc
sleep 2
rm /etc/apache2/conf-available/backuppc.conf
sleep 2
echo "
Alias /backuppc /usr/share/backuppc/cgi-bin/
<Directory /usr/share/backuppc/cgi-bin/>
AllowOverride None
Allow from all
# Uncomment the line below to ensure that nobody can sniff importanti
# info from network traffic during editing of the BackupPC config or
# when browsing/restoring backups.
# Requires that you have your webserver set up for SSL (https) access.
#SSLRequireSSL
Options ExecCGI FollowSymlinks
AddHandler cgi-script .cgi
DirectoryIndex index.cgi
AuthUserFile /etc/backuppc/htpasswd
AuthType basic
AuthName "backuppc"
require valid-user
</Directory>" >> /etc/apache2/conf-available/backuppc.conf
sleep 1
systemctl restart apache2
ip4=$(/sbin/ip -o -4 addr list ens18 | awk '{print $4}' | cut -d/ -f1)
echo "Backup pc core er nå ferdig, men du må fortsatt legge til en klient med neste script!"
echo BackupPC kjører på http://$ip4/backuppc
