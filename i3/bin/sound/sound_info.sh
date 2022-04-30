#!/usr/bin/env bash

VOLUME_MUTE="  "
VOLUME_LOW=" "
VOLUME_MID=" "
VOLUME_HIGH="  "
SOUND_LEVEL=$(
pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
)
MUTED=$(pactl list sinks | grep Mute)
CHECK=*"Mute: yes"*
ICON=$VOLUME_MUTE
if [ "$MUTED" -eq "$CHECK" ]
then
    ICON="$VOLUME_MUTE"
else
    if [ "$SOUND_LEVEL" -lt 15 ]
    then
        ICON="$VOLUME_LOW"
    elif [ "$SOUND_LEVEL" -lt 67 ]
    then
        ICON="$VOLUME_MID"
    else
        ICON="$VOLUME_HIGH"
    fi
fi

echo "$ICON" $SOUND_LEVEL"%"
# echo $MUTED
# echo $ICON
