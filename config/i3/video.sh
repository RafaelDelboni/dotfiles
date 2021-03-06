#!/usr/bin/env bash

[[ -z "${LOCAL_DPI}" ]] && DPI="96" || DPI="${LOCAL_DPI}"
[[ -z "${LOCAL_MODE}" ]] && MODE="2560x1440" || MODE="${LOCAL_MODE}"

PRIMARY=$(xrandr | grep " connected" | grep "primary" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/" | tail -n 1)
SECONDARY=$(xrandr | grep " connected" | grep -v "primary" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/" | tail -n 1)

while getopts ":d :m :n :h :j :k :l" option
do
  case "${option}"
    in
    d) $([ -z "$SECONDARY" ] && xrandr --auto || xrandr --output $SECONDARY --auto --dpi $DPI --mode $MODE --left-of $PRIMARY);;
    m) $(xrandr --output $SECONDARY --auto --same-as $PRIMARY);;
    n) $(xrandr --output $SECONDARY --off);;
    h) $(xrandr --output $SECONDARY --auto --dpi $DPI --mode $MODE --left-of  $PRIMARY);;
    j) $(xrandr --output $SECONDARY --auto --dpi $DPI --mode $MODE --below    $PRIMARY);;
    k) $(xrandr --output $SECONDARY --auto --dpi $DPI --mode $MODE --above    $PRIMARY);;
    l) $(xrandr --output $SECONDARY --auto --dpi $DPI --mode $MODE --right-of $PRIMARY);;
  esac
done
