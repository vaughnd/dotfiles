#!/bin/bash
cwd=`pwd`
find . -iname '*.rar' | while read FILE
do
        d=`dirname "$FILE"`
        f=`basename "$FILE"`

        # only unrar part01.rar or .rar
        echo $f | grep -q 'part[0-9]*.rar$' 2>&1 > /dev/null
        if [ "$?" == "0" ]; then
                echo $f | grep -q 'part01.rar$' 2>&1 > /dev/null
                if [ "$?" == "1" ]; then
                        continue
                fi
        fi

        cd "$d"
        echo "Unrar $f"
        unrar x -o+ "$f"
        cd "$cwd"
done
