# !/usr/bin/env python3

import subprocess

percent = subprocess.getoutput("pactl list sinks | grep \"Volume: front-left: \" ")

percent=int(percent[percent.find("/")+1:percent.find("%")])

ismute=subprocess.getoutput("pactl list sinks | grep Mute")

icon = ""

if("yes" in ismute):
    icon="   "
else:
    if(percent < 15):
        icon="  "
    elif(percent < 67):
        icon="  "
    else:
        icon="   "

print(icon + str(percent) + "%")
