#!/bin/sh

#A command to round the audio output as a percentage. I need this because I have my system
#set to increment/decrement the audio 7% at a time, because I like that.
round() {
    echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
};

#Someone else wrote this. However, the 'if ($7 == "off")' statement doesn't ever find 'off'.
#I don't, unfortunately, know how to use awk, but it seems the -F statement is in an incorrect or outdated
#format for my version of amixer. As such, I bodged my own version of the command under this one.
#$7 changed to $3, "off" changed to "off]" because my bodged awk separator detection is too simple.
#$2 is left the same because of luck.

#bars=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2/7 }}' | head -n 1)
bars=$(amixer get Master | awk -F[ '/%/ {if ($3 == "off]") { print "MM" } else { print $2/7 }}' | head -n 1)

#Round the previous command's output
bars=$(round $bars 0);

#Generate the volume display. If not a number, display mute
case $bars in
  0)  bar='[--------------]' ;;
  1)  bar='[/-------------]' ;;
  2)  bar='[//------------]' ;;
  3)  bar='[///-----------]' ;;
  4)  bar='[////----------]' ;;
  5)  bar='[/////---------]' ;;
  6)  bar='[//////--------]' ;;
  7)  bar='[///////-------]' ;;
  8)  bar='[////////------]' ;;
  9)  bar='[/////////-----]' ;;
  10) bar='[//////////----]' ;;
  11) bar='[///////////---]' ;;
  12) bar='[////////////--]' ;;
  13) bar='[/////////////-]' ;;
  14) bar='[//////////////]' ;;
  *)  bar='----- mute -----' ;;
esac

#Format output for xmobar, I think
echo $essid $bar

exit 0
