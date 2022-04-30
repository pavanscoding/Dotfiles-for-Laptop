import subprocess

info = subprocess.getoutput("sensors | grep temp1")

temp = float(info[info.find("+")+1:info.find("C")])

print(" " + str(temp) + "° C")
