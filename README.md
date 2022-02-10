# backuppc_installationscript

Instruksjoner BACKUP PC SCRIPT.

Hvert steg er merkert hvilken server de gjelder. (backup) er backup-serveren- (klient) er klienten. f.eks cacti, eller en annen ub-server. 

begge servere MÅ være på samme nett! du velger selv om du vil bruke 192.168.1.1 eller ditt nett 192.168.x.1


steg 1:
Opprett en ubuntu-server. 2048mb ram og 1 core holder. Men uviktig.

brukernavnet til denne maskinen SKAL være backuppc. Navn velger du selv, men kall det f.eks backupserver
sørg også for å ha openSSH på denne.

steg 2 (BACKUP):
sudo apt update && sudo apt upgrade

steg 3 (BACKUP):

sudo nano server.sh 

inne i denne filen kopierer du inn innholdet fra STAGE 1  skriptet.
lagre og lukk.

steg 4 (BACKUP):

sudo chmod +x server.sh

steg 5 (BACKUP):

sudo bash server.sh 

Skriptet vil starte, du vil bli bedt om et passord 3 ganger, bruk samme hver gang. Jeg anbefaler også å ha samme passord som du har på backup@backupserver brukeren. Da blir de mindre forvirrende. Ellers vil du bli spørt om litt annet, følg guiden på teams for å se hva du skal starte, men de meste er bare standard.


steg 6 (KLIENT):
Opprett en server / klient. du kan bruke en du har brukt før.

sudo apt update && sudo apt upgrade

steg 7 (KLIENT):

opprett en mappe du vil ta backup av. f.eks/

sudo mkdir /backupmappe

steg 8 (KLIENT):
lag en .txt i backupmappen. denne trenger vi bare for å verifisere at det faktisk fungerer, så hær skriver du hva du vil.

sudo nano /backupmappe/mintekst.txt
lagre og lukk

steg 9 (KLIENT):

sudo nano klient.sh
kopier inn koden fra STAGE 2 skriptet.
lagre og lukk

steg 10 (KLIENT):
Opprett et passord for root. velg passord selv, men HUSK DE!

sudo passwd root

steg 11 (KLIENT):
sudo chmod +x klient.sh

steg 12 (klient):
sudo bash klient.sh
når skriptet er ferdig, er du ferdig med alt du trenger å gjøre på klient maskinen.

steg 13 (backup):
sudo nano server_klient.sh
kopier inn koden fra STAGE 3 skriptet.
lagre og lukk.

steg 14 (backup):
sudo chmod +x server_klient.sh

steg 15 (backup):
sudo bash server_klient.sh
skriv inn ip addresse for klienten.
skriv inn mappe du ønsker backup av, f.eks /backupmappe
alle ssh-keygen greier trykker du enter for default. ikke sett passord på dette.

steg 16 (nettleser):
gå til http://backupserverip/backuppc
logg på med backuppc og passordet du satte i steg 5.


NÅ ER DU FERDIG!

Problemer? can¨t read 4 bytes - issue kanskje?

Av og til skjer det en ssh-key error i skriptet. Følg da desse stegene:

steg 1(backup)

su - backuppc

steg 2 (backup)

ssh-keygen
alt på standard, ikke sett passord! om du blir bedt om å overwrite svarer du YES!

steg 3(backup)

ssh-copy-id root@klient_ip
svar yes til fingerprint.
skriv inn passordet til root på klientpcen.

steg 4(backup)
verifiser at de fungerer.

ssh root@klient_ip

du skal da bli logget inn i klient maskinen. Du skal kunne logge direkte inn uten å skrive passord.

Fortsatt problemer?

Prøv å restarte litt ting

sudo service sshd restart

sudo service apache2 restart 

sudo service backuppc restart

sudo service sshd restart

sudo reboot

Prøv på nytt. 

Fortsatt problemer?
les instruksene skikkelig....
