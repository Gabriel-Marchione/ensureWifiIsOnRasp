#!/bin/bash
ping -c 1 -W 2 8.8.8.8 > debug.txt
#ping -c 1 -W 2 192.192.192.192 > debug.txt

#controllo se NON ho un match della stringa nel file debug.txt
if ! grep -q "1 received" debug.txt; then
    #non a buon fine ho 1
    #connesso ad internet#
    echo "ciao"
    pihole restardns
fi
#se ho un match tutto funziona e non faccio nulla

LOGFILE="/home/gabriel/script/ensureWifiIsOnRasp/connessione.log"

if ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Connessione OK" >> "$LOGFILE"
    # qui puoi aggiungere: sudo systemctl restart pihole-FTL.service
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Nessuna connessione" >> "$LOGFILE"
fi
