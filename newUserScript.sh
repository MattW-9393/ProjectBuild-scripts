#!/bin/bash

echo Welcome to the New User Generator. Let me ask you some questions about the user you want to create!

echo What is their username?
read CHSN_USRNME
echo What would you like their password to be?
read CHSN_PSSWRD

sudo useradd -m -s /bin/bash $CHSN_USRNME
echo "$CHSN_USRNME:$CHSN_PSSWRD" | sudo chpasswd

echo "The following user has beenn created..."
echo "Username: $CHSN_USRNME"
echo "Password: $CHSN_PSSWRD"