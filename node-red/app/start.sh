#!/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Start RS485_de from Seeed Studio
echo "Starting rs485_DE instances.........................." 

cd /usr/local/bin
./rs485_DE /dev/ttyAMA1 /dev/gpiochip0 6 /dev/ttyAMA10 /dev/gpiochip2 12 & 
./rs485_DE /dev/ttyAMA3 /dev/gpiochip0 24 /dev/ttyAMA12 & 
./rs485_DE /dev/ttyAMA2 /dev/gpiochip0 17 /dev/ttyAMA11 & 

echo "rs485_DE instances started..........................."


# Make sure ssh known hosts file is present
if ! test -f /data/known_hosts;
    then
        touch /data/known_hosts;
fi

ssh-keyscan -t rsa github.com >> /data/known_hosts

# Make the default flows available in the user library
mkdir -p /data/node-red/user/lib/flows || true
cp /usr/src/app/flows/* /data/node-red/user/lib/flows/


# Start node-red
node-red --settings /usr/src/app/settings.js
