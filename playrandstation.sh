#!/bin/bash
# vague
# play random station


while true ; do
	if [ "$(( RANDOM % 1000))" -ge "500" ] ; then
		echo radcap
		rand_station=http://radcap.ru/$(shuf -n 1 <(wget -q -O - http://radcap.ru/index-d.html | grep \"[a-z]*.html -o | cut -d '"' -f 2 ))
		stream_url=$(wget -q -O - $rand_station | grep src=\"http://[0-9\.:]*/ -o | sed -e 's/.*\"//')
	else
		echo soma		
		rand_station=http://somafm.com$(shuf -n 1 <(wget http://somafm.com/listen/ -O - | grep AAC.*.pls | cut -d '"' -f 2))
		stream_url=$rand_station
	fi
	
	echo
	echo \# $rand_station
	echo $stream_url
	echo
	
	mpv $stream_url 
done
