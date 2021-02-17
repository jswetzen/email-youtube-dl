#!/bin/sh

echo "$USER"
echo "$FETCHMAIL_DEF" > /root/.fetchmailrc
chmod 0700 /root/.fetchmailrc

fetchmail --silent --nodetach --nosyslog --mda mailtrigger --daemon "${POLL_INTERVAL}"
