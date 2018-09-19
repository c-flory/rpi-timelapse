#!/bin/bash
crontab -r
echo Enter START TIME: Allowed values: 0 - 23
read starttime
echo Enter END TIME: Allowed values: 0 - 23
read endtime
echo Enter START DAY: Allowed values: MON TUE WED THU FRI SAT SUN
read startday
echo Enter END DAY: Allowed values: MON TUE WED THU FRI SAT SUN
read endday
echo Enter location
read location

cat << EOF > /home/pi/rpi-timelapse/camera.sh
#!/bin/bash
LOCATION = $loction
FOLDER = $(date + "%Y-%m-%d")
DATE = $(date + "%Y-%m-%d_%H%M")
raspistill -vf -hf -o /home/pi/$FOLDER/$LOCATION_$DATE.jpg
EOF

cat << EOF > /home/pi/rpi-timelapse/generate-folder.sh
#!/bin/bash
DATE = $(date + "%Y-%m-%d")
mkdir /home/pi/$DATE
EOF

(crontab -l 2>/dev/null; echo "00**$startday-$endday /home/pi/rpi-timelapse/generate-folder.sh 2>&1")
(crontab -l 2>/dev/null; echo "*$starttime-$endtime**$startday-$endday /home/pi/rpi-timelapse/camera.sh 2>&1")

reboot
