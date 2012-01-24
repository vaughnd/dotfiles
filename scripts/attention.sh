#!/bin/bash
activeWinIdLine=`xprop -root | grep _NET_ACTIVE_WINDOW\(WINDOW\) `
activeWinId="${activeWinIdLine:40}"
echo $activeWinId > /tmp/activeWinId
for id in `wmctrl -l | cut -d " " -f 1`; do
	xprop -id $id | grep "_NET_WM_STATE_DEMANDS_ATTENTION" 2>&1 > /dev/null
	if [ "$?" = "0" ]; then
		echo "Attention seeker $id"
		wmctrl -i -a $id
		exit 0
	fi
done
echo "No attention seekers"
exit 1
