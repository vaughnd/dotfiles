#!/bin/sh

terminal="xterm"
terminal_wm_class="$terminal"
terminal_exec="$terminal"

# no terminal started, so start one
if [ -z "`wmctrl -lx | grep $terminal_wm_class`" ]; then
    $terminal_exec &
else
    # search for existing terminals on current desktop
    current_desk=`wmctrl -d | grep '*' | cut -d ' ' -f 1`
    term_on_this_desk=`wmctrl -lx | grep "$current_desk[ ]*$terminal_wm_class" | cut -d ' ' -f 1`
    if [ -n "$term_on_this_desk" ]; then
	wmctrl -i -a $term_on_this_desk
    else
	# no terminals on current desktop, so just open the first one
	wmctrl -x -a $terminal_wm_class
    fi;
fi;