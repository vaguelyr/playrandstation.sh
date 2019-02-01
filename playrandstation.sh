#!/bin/bash
# vague
# pick a random radcap.ru station and play it

# 'q' to quit mpv and load next random url
while true ; do
	# get the url for a random radio station
	url=http://radcap.ru/$(shuf -n 1 <(wget -q -O - http://radcap.ru/index-d.html | grep \"[a-z]*.html -o | cut -d '"' -f 2 ))
	# get the ip address and port to the streaming server
	ip=$(wget -q -O - $url | grep src=\"http://[0-9\.:]*/ -o | sed -e 's/.*\"//')
	# output nicely so you can copy and paste and save your favorite stations
	echo
	echo \# $url
	echo $ip
	echo

	mpv $ip --volume=70
done

