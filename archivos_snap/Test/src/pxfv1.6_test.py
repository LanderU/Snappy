#!/usr/bin/python

import os
import time
import sys

#------- I2Ctest --------#
print ('Conecte al conector I2C (4 pins) y el serial al ttyO5/ttyO4, y pulsa INTRO...')
key=sys.stdin.read(1)
f=os.popen('sudo i2cdetect -r -y 1 > i2ctest.txt')
time.sleep(2)

b = '1e'
file=open('i2ctest.txt','r')
line=file.readline()
while line!="":
        if b in line:
                validate=0
                break
        else:
		validate=1
             	line=file.readline()

if validate==0:
        print '----------- I2C OK -----------'
else:
        print '----------I2C COMPROBAR-------'
print('############################################')
print ('')
#---------- ttyO5 ---------#
print ('Conecta el cable de 6 pines al conector ttyO5, y pulsa INTRO...')
key=sys.stdin.read(1)
f=os.popen('sudo cat /dev/ttyO5 > ttyO5.txt')
time.sleep(8)
f=os.popen('sudo pkill cat 2> /dev/null')
if os.stat("ttyO5.txt").st_size==0:
        print "------ Revisar ttyO5 --------"
else:
        print "------ ttyO5 OK -------------"

#---------- ttyO4 ---------#
print('##########################################')
print('')
print ('Conecta el cable de 6 pines al conector ttyO4, y pulsa INTRO...')
key=sys.stdin.read(1)
f=os.popen('sudo cat /dev/ttyO4 > ttyO4.txt')
time.sleep(8)
f=os.popen('sudo pkill cat 2> /dev/null')
if os.stat("ttyO4.txt").st_size==0:
        print "------ Revisar ttyO4 -----"
else:
        print "------ ttyO4 OK ----------"
print('########################################')
print('')
#---- SENSOR TEST USING ARDUCOPTER ----#

f=os.popen('sudo systemctl stop copter.service')
f=os.popen('sudo systemctl stop copter.service')
f=os.popen('sudo systemctl stop copter.service')
f=os.popen('sudo systemctl stop copter.service')
f=os.popen('sudo ./ArduCopter-3IMU.elf > test_out.txt')

#Wait Arducopter to fill the txt
print "Time"
time.sleep(20)

#Check for errors
if 'Failed to boot MPU6000' in open('test_out.txt').read():
        print "MPU6000: No Funciona"

if 'LSM9DS0: unexpected gyro WHOAMI' in open('test_out.txt').read():
	print "LSM9D: No Funciona"

if 'LSM9DS0: unexpected acc/mag  WHOAMI' in open('test_out.txt').read(): 
        print "LSM9D: No Funciona"

if 'MPU9250: unexpected WHOAMI' in open('test_out.txt').read():
        print "MPU9250: No Funciona"

if 'Bad CRC on MS5611' in open('test_out.txt').read():
	print "MS5611: No Funciona"

if 'Ready to FLY' in open('test_out.txt').read():
	print "MPU6000 OK, MPU02950 OK, LSM9D OK, MS5611 OK"

#Kill ArduCOpter, after txt
f=os.popen('sudo sh kill.sh')
f=os.popen('sudo rm test_out.txt')
f=os.popen('sudo rm i2ctest.txt')
f=os.popen('sudo rm ttyO4.txt')
f=os.popen('sudo rm ttyO5.txt')
print ('#########################################')
print ('')
print 'Test terminado'
