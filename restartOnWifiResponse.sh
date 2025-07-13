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