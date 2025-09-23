#!/bin/bash

# import list of first names and second names and store them in lists
mapfile FIRSTNAMES < /firstname.txt
mapfile SECONDNAMES < /secondname.txt

# generate a random firstname and second name

RANDOM_FNAME=$(echo ${FIRSTNAMES[$RANDOM % ${#FIRSTNAMES[@]} ]})
RANDOM_SNAME=$(echo ${SECONDNAMES[$RANDOM % ${#SECONDNAMES[@]} ]})

#concatenate these names into a username
FNAME_SNAME=$(echo $RANDOM_FNAME-$RANDOM_SNAME)

#make it readable, convert all chars to lower case etc
READABLE_VERSION=$(echo $FNAME_SNAME | iconv -t ascii//TRANSLIT | -r s/[^a-zA-Z0-9] +/-/g | tr A-Z a-z)

#generate random 24 char password
PASSWORD=$(cat /dev/urandom | tr-cd '[:graph]' | fold -w 24 | head -n 1)

