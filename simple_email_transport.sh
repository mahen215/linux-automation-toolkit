#!/bin/bash

echo "=== Email Sender ==="
echo ""

read -p "Enter Your Gmail  : " SENDER
read -sp "Enter App Password: " PASSWORD
echo ""
read -p "Enter Receiver Gmail: " RECEIVER
read -p "Enter Subject       : " SUBJECT
read -p "Enter Message       : " MESSAGE

echo ""
echo "******* Sending Email... *******"
echo ""

curl --ssl-reqd \
  --url "smtps://smtp.gmail.com:465" \
  --user "$SENDER:$PASSWORD" \
  --mail-from "$SENDER" \
  --mail-rcpt "$RECEIVER" \
  --upload-file - <<EOF
Subject: $SUBJECT
From: $SENDER
To: $RECEIVER

