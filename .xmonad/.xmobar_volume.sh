#!/bin/sh

round() {
    echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
};

bars=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2/7 }}' | head -n 1)
bars=$(round $bars 0);

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
  *)  bar='[------!!------]' ;;
esac

echo $essid $bar

exit 0