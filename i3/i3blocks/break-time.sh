#!/bin/bash


# Minutes
work_time=20
break_time=5

FILE=/tmp/i3blocksBreakTime.txt


if [ ! -e $FILE ]; then
	echo $(date +%s) > $FILE # Current timestamp
	echo 0 >> $FILE # Last message shown time
fi

start_time=$(head -n1 $FILE)
current_time=$(date +%s)
diff=$(($current_time - $start_time)) 
minutes=$((($diff / 60) % 60))
seconds=$(($diff % 60 ))

if [ $work_time -eq $minutes ] || [ $work_time -lt $minutes ]; then
	last_shown_time=$(tail -1 $FILE)

    # How much time past after message display.
	after_display=$((((($current_time - $last_shown_time)) / 60) % 60)) 
    
    # Show message again at least one minute after
    # Checking 
	if [ $after_display -gt 1 ] || [ $after_display -eq 1 ]; then
		pkill i3-nagbar
		break_end=$(($current_time + $break_time * 60))
		last_shown_time=$current_time
		
		i3-nagbar -m "Time is up! Rest for $break_time minutes." \
		-t warning -f 'pango:DejaVu Sans Mono 20' \
		-b REST "echo \"$break_end\n0\" > $FILE && pkill i3-nagbar " \
		-b '1 Minute' "echo $last_shown_time >> $FILE && pkill i3-nagbar" &> /dev/null &
	fi
fi

echo "$minutes:$seconds"
