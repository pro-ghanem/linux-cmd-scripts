#!/bin/bash

folders='images music videos'
ext_img="*.JPG *.png"
ext_music="*.mp3 *.flac"
ext_vid="*.avi *.mov"
logs="*.log"
for folder in $folders
do

	if [ $folder == 'images' ]
	then
		mkdir -p $folder
		mv $ext_img $folder 2>/dev/null

	elif [ $folder == 'music' ]
	then
		mkdir -p $folder
		mv $ext_music $folder 2>/dev/null
	
	elif [ $folder == 'videos' ]
	then
		mkdir -p $folder
		mv $ext_vid $folder 2>/dev/null

	fi
rm -fr *.log
done
