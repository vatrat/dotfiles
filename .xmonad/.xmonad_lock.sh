#!/bin/bash
# ┏━┓┳  o┏┓┓┏━┓┳ ┳┳  ┏━┓┏━┓┳┏ 
# ┃ ┳┃  ┃ ┃ ┃  ┃━┫┃  ┃ ┃┃  ┣┻┓
# ┇━┛┇━┛┇ ┇ ┗━┛┇ ┻┇━┛┛━┛┗━┛┇ ┛
#
# author: xero <x@xero.nu> http://xero.nu
# requires: i3lock-color, imagemagick, scrot


GLITCHICON=/home/vatrat/Pictures/absolutpropr.jpg


scrot /tmp/lock.png
convert /tmp/lock.png -filter point -resize 40% -resize 250% /tmp/lock.png
convert /tmp/lock.png /tmp/lock.jpg
file=/tmp/lock.jpg

function datamosh() {
	fileSize=$(wc -c < "$file")
	headerSize=1000
	skip=$(shuf -i "$headerSize"-"$fileSize" -n 1)
	count=$(shuf -i 1-10 -n 1)
	for i in $(seq 1 $count);do byteStr=$byteStr'\x'$(shuf -i 0-255 -n 1); done;   
	printf $byteStr | dd of="$file" bs=1 seek=$skip count=$count conv=notrunc >/dev/null 2>&1
}

steps=$(shuf -i 40-70 -n 1)
for i in $(seq 1 $steps);do datamosh "$file"; done

GLITCHICON=${GLITCHICON:=""}
# PARAM=(--bar-indicator --bar-position h --bar-direction 2 --redraw-thread -t "" \
# 	--bar-step 100 --bar-width 50 --bar-base-width 200 --bar-max-height 600 --bar-periodic-step 50 \
# 	--bar-color 0F0F0F57 --keyhlcolor 00666656 --ringvercolor cc87875f --wrongcolor ffff0050 \
# 	--veriftext="" --wrongtext="" --noinputtext="" --pass-screen-keys )

# PARAM=(--bar-indicator --bar-direction 2 --redraw-thread -t "" \
#     --bar-step 100 --bar-total-width 50 --bar-base-width 200 --bar-max-height 600 --bar-periodic-step 50 \
#     --bar-color 0F0F0F57 --keyhl-color 00666656 --verif-color cc87875f --wrong-color ffff0050 \
#     --verif-text="" --wrong-text="" --noinput-text="" --pass-screen-keys )

PARAM=(--screen=1 --bar-indicator --bar-direction 2 --redraw-thread  \
    --bar-pos 0:540 -t "" --bar-step 80 \
    --bar-total-width 1920 --bar-base-width 200 \
    --bar-max-height 400 --bar-periodic-step 80 --bar-count 35 \
    --bar-color 0F0F0F57 --keyhl-color 00666656 --verif-color cc87875f \
    --wrong-color ffff0050 --verif-text="" --wrong-text="" --noinput-text="" \
    --pass-screen-keys --pass-volume-keys )

LOCK=()
while read LINE
do
	if [[ "$LINE" =~ ([0-9]+)x([0-9]+)\+([0-9]+)\+([0-9]+) ]]; then
		W=${BASH_REMATCH[1]}
		H=${BASH_REMATCH[2]}
		Xoff=${BASH_REMATCH[3]}
		Yoff=${BASH_REMATCH[4]}
		if [ ! -z "$GLITCHICON" ]; then
			IW=`identify -ping -format '%w' $GLITCHICON`
			IH=`identify -ping -format '%h' $GLITCHICON`
			MIDXi=$(($W / 2 + $Xoff - $IW / 2))
			MIDYi=$(($H / 2 + $Yoff - $IH / 2))
			LOCK+=($GLITCHICON -geometry +$MIDXi+$MIDYi -composite)
		fi
	fi
done <<<"$(xrandr)"

convert /tmp/lock.jpg /tmp/lock.png >/dev/null 2>&1
rm /tmp/lock.jpg
file=/tmp/lock.png

convert "$file" "${LOCK[@]}" "$file"

i3lock -n "${PARAM[@]}" -i "$file" > /home/vatrat/lock_log.txt 2>&1
