# Photobomb box

## enum

- web for printing image with input
    - img name: LFI
	- run exiftool with the output image (printed img). We see an intersting info that Little CMS. It has LFI vul in searchsploit. but current web run on ruby, not php. That maybe it not work.
    - type, size: command injection
	- i try to do an command injection. that I change the file type to `filetype=png.txt`.
		- then the output file is .txt file. And hint to me that the web use `ImageMagick` to convert images.
