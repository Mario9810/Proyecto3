#!/usr/bin/python
import RPi.GPIO as GPIO
import time


#general variables
startime = time.time()

#GPIO SETUP
sound = 17
led = 27
boom = 7500000
GPIO.setmode(GPIO.BCM)
GPIO.setup(sound, GPIO.IN)
def callback(sound):
        f1 = open("data.txt","r")
        f2 = open("data.txt","a")
        aData = f1.read()
        print(aData)
        if GPIO.input(sound):
                #print ("Sound Detected!")
                f2.write("2")
        else:
                #print ("Sound Detected Low!")
                f2.write("1")
GPIO.add_event_detect(sound, GPIO.BOTH, bouncetime=10)  # let us know when the pin goes HIGH or LOW
GPIO.add_event_callback(sound, callback)  # assign function to GPIO PIN, Run function on change

# infinite loop
while boom >0:
    time.sleep(0.01)
    f3 = open("data.txt","a")
    f3.write("0")
    boom -= 1