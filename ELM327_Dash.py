#!/usr/bin/env python
import socket
import datetime
import time
import sys
import os

MODE='01'
ELM_PROMPT = '>'
root_dir = os.getcwd()
strings = []


print '\nTool_SW_Vers: '
version=os.path.basename(__file__)
print version
print 'developed by Sebastian Kienitz'

#------FUNCTIONS--------------------------------------------------------------------

def send_cmd(cmd):
    data=''
    cmd += "\r" # terminate
    s.send(cmd)
    i=0
    while True:
        data=data+s.recv(64)
        i=i+1
        if (data.endswith(ELM_PROMPT) or len(data)>128 or i>10):
            if len(data)>128:
                s.send("\r")
            break
    # remove the prompt character
    data = data[:-1]
    # splits into lines while removing empty lines and trailing spaces
    data = data.replace('\r','')
    data = data [len(cmd)-1:]
    """time.sleep(1)"""
    return data

def get_dec(PID):
    response=send_cmd(MODE + PID)
    response=response.replace('41','')
    response=response.replace(PID,'')
    response=response.replace(' ','')
    if(len(response)>2):
        A=response[:-2]
        B=response[2:]
    else:
        A=response
        B='00'
    return [int(A, 16),int(B,16)]

"""INIT DONGLE-------------------------------------"""
s = socket.socket()
host = '192.168.0.10' # needs to be in quote
port = 35000
s.connect((host, port))
send_cmd("\r") 
send_cmd("ATSP0")
send_cmd("ATD")
protocol=send_cmd("ATDPN")[1:]
send_cmd("0100")
send_cmd("ATAT2")



#--------------------------MAIN---------------------------------------------------------------------------------------------------------------

while(True):
    strings = []
    strings.append('Battery Voltage:' + send_cmd('ATRV'))
    strings.append('Load: ' + str(get_dec('04')[0]/2.55) + '%')
    strings.append('Coolant: ' + str(get_dec('05')[0]-40) + ' deg C')
    strings.append('RPM: ' + str((256*get_dec('0C')[0] + get_dec('0C')[1])/4) + ' rpm')
    strings.append('Timing Adv: ' + str(get_dec('0E')[0]/2-64) + ' deg')
    strings.append('Intake Air Temp: ' + str(get_dec('0F')[0]-40) + ' deg C')
    strings.append('MAF: ' + str((256*get_dec('10')[0] + get_dec('10')[1])/100) + ' g/sec')
    strings.append('Throttle: ' + str(100*get_dec('11')[0]/255) +'%')
    for string in strings:
        print (string + '\n')
    os.system('cls' if os.name == 'nt' else 'clear')
