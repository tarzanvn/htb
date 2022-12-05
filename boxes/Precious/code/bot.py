#!/usr/bin/python3

## read file
with open('/mnt/ctf/htb/boxes/Precious/code/ports.txt') as f:
    alist = [line.rstrip() for line in f]


out_file="/mnt/ctf/htb/boxes/Precious/code/oPorts.txt"
out_f = open(out_file, 'w')
def getAllPort(s):
    begin = s[:s.find('-')]
    end = s[s.find('-')+1:]
    for p in range(int(begin), int(end)+1):
        out_f.write(str(p)+"\n")

for l in alist:
    getAllPort(l)

out_f.close()