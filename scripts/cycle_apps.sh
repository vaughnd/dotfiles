#!/bin/bash
# Cycles through the following apps using find_and_focus_x.sh
apps=("emacs" "konsole" "google-chrome")

LASTAPP_FILE=~/.lastapp

lastapp='emacs'
if [ -f $LASTAPP_FILE ]; then
    lastapp=`cat $LASTAPP_FILE`
fi

newapp=""
for index in ${!apps[*]}; do
    if [ "${apps[$index]}" == "$lastapp" ]; then
        newapp=${apps[$index+1]};
    fi
done
if [ -z "$newapp" ]; then
    newapp=${apps[0]}
fi

echo "$newapp" > $LASTAPP_FILE

`dirname $0`/find_and_focus_x.sh $newapp
