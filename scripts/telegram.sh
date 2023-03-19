#!/bin/bash

CHAT_ID=
BOT_TOKEN=

# prepare any message you want
login_ip="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
login_date="$(date +"%T, %d.%m.%Y")"
login_name="$(whoami)"
login_hostname="$(hostname -f)"

# Country by ip-api.com
login_country="$(curl --silent "http://ip-api.com/line/"$login_ip"?fields=1")" 

# Message
# Includes Hostname, Username, IP, Country, Date & Time
message="New SSH login"$'\nServer: '"$login_hostname"$'\nUser: '"$login_name"$'\nIP: '"$login_ip"$'\nCountry: '"$login_country"$'\nDate: '"$login_date"

# Send Message form Bot to Chat
curl -s --data "text=$message" --data "chat_id=$CHAT_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null
