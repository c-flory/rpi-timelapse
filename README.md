# rpi-timelapse
raspberrry pi time lapse

1. Transfer NOOBS onto an empty SD card: https://www.raspberrypi.org/downloads/noobs/
2. Download NOOBS onto the Raspberry Pi
3. Clone this repository by typing into the command prompt: `git clone https://www.github.com/c-flory/rpi-timelapse`
4. in the terminal, enable the script to run by typing in 'sudo chmod +x home/pi//rpi-timelapse/setup.sh'
5. Run the setup by typing into the command prompt: `./home/pi/rpi-timelapse/setup.sh`
6. Follow command prompts.
Start time is the hour in which you want the time lapse to begin (0 - 23).
End time is the hour in which the time lapse is to end (0 - 23).
Start day is the day in which the time lapse should begin (Mon - Fri)
End day is the day in which the time lapse should end (Mon - Fri)
Location is the location of camera, or any distinguishable name you wish to give.

The Raspberry Pi will automatically reboot and be ready to go.

Note:
A photo taken with the camera module will be around 2.4MB. This is about 425 photos per GB.

This setup sets the camera to take a photo every minute.

Taking 1 photo per minute would take up 1GB in about 7 hours. This is a rate of about 144MB per hour or 3.3GB per day.
