#!/bin/bash
if [ -f /tmp/activeWinId ]; then
	origWinId=`cat ~/activeWinId`
	wmctrl -i -a $origWinId
fi
