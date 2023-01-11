#!/bin/sh

	BATT=$(apm -l)
	DATE=$(date '+%a %d %b %H:%M')
	GRP=$(xprop -root 32c '\t$0' _NET_CURRENT_DESKTOP | cut -f 2)
	VOL=$(sndioctl -n output.level | awk '{ print int($0*100) }')

	echo "Juice: $BATT% | Vol: $VOL% | $DATE"

#EOF
