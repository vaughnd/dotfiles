#!/bin/sh

app="$1"
app_wm_class="$app"
app_exec="$app"

# no app started, so start one
if [ -z "`wmctrl -lx | grep $app_wm_class`" ]; then
    $app_exec &
else
    # search for existing apps on current desktop
    current_desk=`wmctrl -d | grep '*' | cut -d ' ' -f 1`
    term_on_this_desk=`wmctrl -lx | grep "$current_desk[ ]*$app_wm_class" | cut -d ' ' -f 1`
    if [ -n "$term_on_this_desk" ]; then
	wmctrl -i -a $term_on_this_desk
    else
	# no apps on current desktop, so just open the first one
	wmctrl -x -a $app_wm_class
    fi;
fi;
