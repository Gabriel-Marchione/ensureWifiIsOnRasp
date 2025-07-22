#!/bin/bash

googleIpAddress=8.8.8.8

scriptDir="$(dirname "$0")" #con $(dirname "$0") mi prendo il nome della directory
stateFile="/tmp/no_connection_flag"
logFile="$scriptDir/log.txt"

if ! ping -c 1 -W 2 "$googleIpAddress" > /dev/null 2>&1; then
    if [ ! -f "$stateFile" ]; then
    echo "$(date) - Connessione PERSA" >> "$logFile" 
    touch "$stateFile"
    fi 
else
    if [ -f "$stateFile" ]; then
        echo "$(date) - Connessione RISTABILITA" >> "$logFile" 
        echo "pihole restartdns"
        rm "$stateFile"
    fi
fi


