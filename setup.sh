#!/bin/bash
crontab -r
echo Enter START TIME: Allowed values: 0 - 23
read starttime
echo Enter END TIME: Allowed values: 0 - 23
read endtime
echo Enter START DAY: Allowed values: MON TUE WED THU FRI SAT SUN
read startday
echo Enter END DAY: Allowed values: MON TUE WED THU FRI SAT SUN
echo endday

(crontab -l 2>/dev/null; echo "*$starttime-$endtime**$startday-$endday /home/pi/rpi-timelapse/camera.sh 2>&1")
