import subprocess

info = subprocess.getoutput('acpi')
icon = ""
charge=int(info[info.find(",")+1:info.find("%")])

if("Charging" in info):
    icon = ""
else:
    if(charge>87):
        icon="   "
    elif(charge>63):
        icon="   "
    elif(charge>40):
        icon="   "
    elif(charge>15):
        icon="   "
    else:
        icon="   "
print(icon+" "+str(charge)+"%")

    
