# wordpress scan
	## basic
	wpscan --url http://backdoor.htb
	## aggressive enum plugin; -e vp --> enumerate vul pluggin
	wpscan --url http://backdoor.htb --plugins-detection aggressive -e vp
	# ap = all plugin
	wpscan --url http://backdoor.htb --plugins-detection aggressive -e ap
	## enum user
	wpscan --url http://backdoor.htb -e u


# content discovery
	## fuff
	ffuf -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://10.10.235.36/FUZZ

	## dirb
	dirb http://10.10.235.36/ /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt

	## gobuster
	gobuster dir --url http://10.10.235.36/ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt


# subdomain enum
	# fuzz
	ffuf -w /usr/share/wordlists/SecLists/Discovery/DNS/namelist.txt -H "Host: FUZZ.acmeitsupport.thm" -u http://10.10.184.72 -fs {size}
	
	
# Netcat Shell Stabilisation (ref: https://tryhackme.com/room/introtoshells)
	## python shell
	python -c "import pty;pty.spawn('/bin/bash');"
	export TERM=xterm
	
	#ctrl + z: to run process in background.
	# enable tab, and ctrl+c; then return the process.
	stty raw -echo; fg
