# Python3.7

import socket
import sys
from time import *

print("# Port list: echo, systat, qqtd, msp, ftp-data, ftp,")
print("# telnet, smtp, name, bootps, bootpc, tftp,")
print("# gopher, finger, http, kerberos, pop3,")
print("# nntp, ssl or https and nfs ...")
sleep(2)

host=input(" >>> IP_address or required domain: ")
sleep(1)

port=[7, 11, 18, 20, 21, 23, 25, 42, 67, 68, 69, 70, 79, 80, 88, 110, 119, 443, 2049]

for i in port:
    try:
        scan=socket.socket()
        scan.settimeout(0.5)
        scan.connect((host, i))
    except socket.error:
        print("Check for", i,"Is Closed", "... done")
    else:
        print("Check for", i,"Open!", "... done")

print("\n")
input("Press ENTER to exit() ")
