#!/bin/bash

CHATID="$YOUR_CHAT_ID"
KEY="$YOUR_KEY"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="This text is sent from my $USER"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $URL >/dev/null
