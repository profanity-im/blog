#! /bin/bash

HUGODATE=$(date --iso-8601=seconds)
USERNAME=$(whoami)

# Stolen from https://stackoverflow.com/questions/833227/whats-the-easiest-way-to-get-a-users-full-name-on-a-linux-posix-system
USER_RECORD="$(getent passwd $USERNAME)"
USER_GECOS_FIELD="$(echo "$USER_RECORD" | cut -d ':' -f 5)"
USER_FULL_NAME="$(echo "$USER_GECOS_FIELD" | cut -d ',' -f 1)"

echo "Please insert the blog posts title and press ENTER."
read -r TITLEINPUT
TITLE=${TITLEINPUT,,}	# To lower case
TITLE=${TITLE//ä/ae}
TITLE=${TITLE//ö/oe}
TITLE=${TITLE//ü/ue}
TITLE=${TITLE//ß/ss}
TITLE=${TITLE//\ -\ /\ }	# Replace " - " with space
TITLE=${TITLE//[@-.:,;?!\/]/}	# Remove special characters
TITLE=${TITLE//\ /-} 	# Replace spaces with -

cat > ./content/post/"$TITLE".md << EOF
---
title: "$TITLEINPUT"
date: $HUGODATE
authors:
  - $USERNAME
---

*Written by $USER_FULL_NAME*

EOF

editor ./content/post/"$TITLE".md
