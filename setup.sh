#!/bin/bash

sudo apt-get update

sudo crontab -r
read -p 'Enter START TIME: Allowed values: 0 - 23: ' starttime
read -p 'Enter END TIME: Allowed values: 0 - 23: ' endtime
read 'Enter START DAY: Allowed values: MON TUE WED THU FRI SAT SUN: ' startday
read 'Enter END DAY: Allowed values: MON TUE WED THU FRI SAT SUN: ' endday
read 'Enter location: ' location

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

sudo chmod +x /home/pi/rpi-timelapse/camera.sh
sudo chmod +x /home/pi/rpi-timelapse/generate-folder.sh

echo Creating crontab

(crontab -l 2>/dev/null; echo "00**$startday-$endday /home/pi/rpi-timelapse/generate-folder.sh 2>&1")
(crontab -l 2>/dev/null; echo "*$starttime-$endtime**$startday-$endday /home/pi/rpi-timelapse/camera.sh 2>&1")

echo RPi will now reboot...

reboot
