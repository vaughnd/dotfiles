==== Misc utility scripts ===

unrar_in_subdirs.sh: 
    I got gatvol of traversing directories and running unrar manually, so I wrote this script. It dives down into subdirectories looking for .rar or part01.rar files and then unrars them in the subdirectory. It also deals with spaces in filenames and directory names. Probably not the cleanest solution, but in Bash scripting TMTOWTDI. With a bit of tweaking it’ll work for unzip and all the others.

==== Window management scripts ====

Prerequisite: install wmctrl 

attention.sh: 
	Focus the window begging for attention, even on another desktop. Bind this to, e.g. Alt-x

attention_undo.sh: 
	Jump back to the window you were in before calling attention.sh. Bind this to, e.g. Alt-shift-x.

find_and_focus_x.sh <app>
	Either focus the app on your current desktop, the first one found on another desktop, or start it. 

cycle_apps.sh
    Cycles through the array of apps using find_and_focus_x.sh
